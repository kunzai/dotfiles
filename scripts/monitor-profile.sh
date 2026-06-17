#!/usr/bin/env bash
set -euo pipefail

PROFILE="${1:-}"
WS_DIR="${HOME}/.config/ws-monitors"
CURRENT_WS_FILE="${WS_DIR}/workspaces-current.conf"

FLOW_DESC="desc:Tianma Microelectronics Ltd. TL134ADXP03"
LG_DESC="desc:LG Electronics 17MT70 509NZLL087136"
WORK_DESC="desc:Samsung Electric Company LS24D60xU HNAX700460"
GARAGE_DESC="desc:GIGA-BYTE TECHNOLOGY CO. LTD. M32U"
GARAGE4K_DESC="desc:GIGA-BYTE TECHNOLOGY CO. LTD. M32U"
Z13_REFRESH="${Z13_REFRESH:-180}"

usage() {
  cat <<'EOF'
Usage:
  monitor-profile.sh PROFILE

Profiles:
  laptop
  lg-left
  lg-right
  work
  garage
  garage4k
EOF
  exit 1
}

require_profile() {
  [[ -n "${PROFILE}" ]] || usage
}

require_tools() {
  command -v hyprctl >/dev/null 2>&1 || {
    echo "hyprctl not found" >&2
    exit 1
  }
  mkdir -p "${WS_DIR}"
}

set_workspaces_file() {
  local src="$1"
  [[ -f "${src}" ]] || {
    echo "Workspace file not found: ${src}" >&2
    exit 1
  }
  cp "${src}" "${CURRENT_WS_FILE}"
}

lua_quote() {
  local s="${1//\\/\\\\}"
  s="${s//\"/\\\"}"
  printf '%s' "$s"
}

hypr_dispatch() {
  local code="$1"
  hyprctl dispatch "$code" >/dev/null
}

hypr_eval() {
  local code="$1"
  hyprctl eval "$code" >/dev/null
}

monitor_enable() {
  local output="$1"
  local mode="$2"
  local position="$3"
  local scale="$4"

  hypr_eval "hl.monitor({ output = \"$(lua_quote "$output")\", mode = \"$(lua_quote "$mode")\", position = \"$(lua_quote "$position")\", scale = ${scale} })"
}

monitor_disable() {
  local output="$1"
  hypr_eval "hl.monitor({ output = \"$(lua_quote "$output")\", disabled = true })"
}

workspace_go() {
  local ws="$1"
  hypr_dispatch "hl.dsp.workspace(\"$(lua_quote "$ws")\")"
}

move_ws_to_monitor() {
  local ws="$1"
  local mon="$2"
  hypr_dispatch "hl.dsp.moveworkspacetomonitor(\"$(lua_quote "$ws")\", \"$(lua_quote "$mon")\")" || true
}

focus_monitor() {
  local mon="$1"
  hypr_dispatch "hl.dsp.focusmonitor(\"$(lua_quote "$mon")\")" || true
}

move_existing_workspaces() {
  local target="$1"
  for ws in 1 2 3 4 5 6 7 8 9; do
    move_ws_to_monitor "$ws" "$target"
  done
}

reload_config() {
  hyprctl reload >/dev/null
  sleep 0.2
}

on_battery() {
  for status_file in /sys/class/power_supply/BAT*/power_status /sys/class/power_supply/BAT*/status; do
    if [[ -f "$status_file" ]]; then
      val=$(cat "$status_file" 2>/dev/null || true)
      if [[ "$val" == "Discharging" || "$val" == "discharging" ]]; then
        return 0
      fi
    fi
  done
  return 1
}

get_laptop_refresh() {
  if on_battery; then
    echo "60.00"
  else
    echo "180.00"
  fi
}

apply_laptop() {
  set_workspaces_file "${WS_DIR}/workspaces-laptop.conf"
  reload_config

  move_existing_workspaces "$FLOW_DESC"
  sleep 0.2

  monitor_disable "$WORK_DESC"
  monitor_disable "$LG_DESC"
  monitor_disable "$GARAGE_DESC"
  monitor_disable "$GARAGE4K_DESC"

  local refresh
  refresh=$(get_laptop_refresh)

  monitor_enable "$FLOW_DESC" "2560x1600@${refresh}Hz" "0x0" 1.6

  workspace_go "1"
}

apply_lg_left() {
  set_workspaces_file "${WS_DIR}/workspaces-lg.conf"
  reload_config

  monitor_disable "$WORK_DESC"
  monitor_disable "$GARAGE_DESC"
  monitor_disable "$GARAGE4K_DESC"

  monitor_enable "$LG_DESC" "2560x1600@59.97" "0x0" "1.6"
  monitor_enable "$FLOW_DESC" "2560x1600@${Z13_REFRESH}" "1600x0" "1.6"

  move_existing_workspaces "$LG_DESC"
  move_ws_to_monitor "1" "$FLOW_DESC"
  workspace_go "1"
}

apply_lg_right() {
  set_workspaces_file "${WS_DIR}/workspaces-lg.conf"
  reload_config

  monitor_disable "$WORK_DESC"
  monitor_disable "$GARAGE_DESC"
  monitor_disable "$GARAGE4K_DESC"

  monitor_enable "$FLOW_DESC" "2560x1600@${Z13_REFRESH}" "0x0" "1.6"
  monitor_enable "$LG_DESC" "2560x1600@59.97" "1600x0" "1.6"

  move_existing_workspaces "$LG_DESC"
  move_ws_to_monitor "1" "$FLOW_DESC"
  workspace_go "1"
}

apply_work() {
  set_workspaces_file "${WS_DIR}/workspaces-work.conf"
  reload_config

  monitor_disable "$LG_DESC"
  monitor_disable "$GARAGE_DESC"
  monitor_disable "$GARAGE4K_DESC"

  monitor_enable "$FLOW_DESC" "2560x1600@${Z13_REFRESH}" "0x0" "1.6"
  monitor_enable "$WORK_DESC" "2560x1440@99.95" "0x-1440" "1"

  move_existing_workspaces "$WORK_DESC"
  move_ws_to_monitor "1" "$FLOW_DESC"
  focus_monitor "$WORK_DESC"
  workspace_go "1"
}

apply_garage() {
  set_workspaces_file "${WS_DIR}/workspaces-garage.conf"
  reload_config

  monitor_disable "$WORK_DESC"
  monitor_disable "$LG_DESC"

  monitor_enable "$FLOW_DESC" "2560x1600@${Z13_REFRESH}" "0x0" "1.6"
  monitor_enable "$GARAGE_DESC" "3840x2160@60" "0x-1350" "1.6"

  move_existing_workspaces "$GARAGE_DESC"
  move_ws_to_monitor "1" "$FLOW_DESC"
  focus_monitor "$GARAGE_DESC"
  workspace_go "1"
}

apply_garage4k() {
  set_workspaces_file "${WS_DIR}/workspaces-garage.conf"
  reload_config

  monitor_disable "$WORK_DESC"
  monitor_disable "$LG_DESC"

  monitor_enable "$FLOW_DESC" "2560x1600@${Z13_REFRESH}" "0x0" "1.6"
  monitor_enable "$GARAGE4K_DESC" "3840x2160@60" "0x-2160" "1"

  move_existing_workspaces "$GARAGE4K_DESC"
  move_ws_to_monitor "1" "$FLOW_DESC"
  focus_monitor "$GARAGE4K_DESC"
  workspace_go "1"
}

main() {
  require_profile
  require_tools

  case "$PROFILE" in
  laptop)
    apply_laptop
    ;;
  lg-left)
    apply_lg_left
    ;;
  lg-right)
    apply_lg_right
    ;;
  work)
    apply_work
    ;;
  garage)
    apply_garage
    ;;
  garage4k)
    apply_garage4k
    ;;
  *)
    usage
    ;;
  esac
}

main "$@"
