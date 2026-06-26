#!/usr/bin/env bash
set -euo pipefail

PROFILE="${1:-}"
WS_DIR="${HOME}/.config/ws-monitors"
HYPR_DIR="${HOME}/.config/hypr"
CURRENT_WS_FILE="${WS_DIR}/workspaces-current.conf"

FLOW_DESC="desc:Tianma Microelectronics Ltd. TL134ADXP03"
LG_DESC="desc:LG Electronics 17MT70 509NZLL087136"
WORK_DESC="desc:Samsung Electric Company LS24D60xU HNAX700460"
GARAGE_DESC="desc:GIGA-BYTE TECHNOLOGY CO. LTD. M32UC 24270B001826"
GARAGE4K_DESC="desc:GIGA-BYTE TECHNOLOGY CO. LTD. M32UC"

usage() {
  cat <<'EOF'
Usage:
  monitor-profile.sh PROFILE

Profiles:
  laptop
  lg-above
  lg-alone
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
  mkdir -p "${WS_DIR}" "${HYPR_DIR}"
}

set_workspaces_file() {
  local src="$1"
  [[ -f "${src}" ]] || {
    echo "Workspace file not found: ${src}" >&2
    exit 1
  }
  cp "${src}" "${CURRENT_WS_FILE}"
}

swap_workspace_rules() {
  local profile="$1"
  local rules_file="${WS_DIR}/workspace-rules-${profile}.lua"

  [[ -f "${rules_file}" ]] || {
    echo "Workspace rules file not found: ${rules_file}" >&2
    exit 1
  }

  cp "${rules_file}" "${HYPR_DIR}/workspace-rules-active.lua"
}

swap_monitor_profile() {
  local profile="$1"
  local mon_file="${WS_DIR}/monitor-profile-${profile}.lua"

  [[ -f "${mon_file}" ]] || {
    echo "Monitor profile file not found: ${mon_file}" >&2
    exit 1
  }

  cp "${mon_file}" "${HYPR_DIR}/monitor-profile-active.lua"
}

write_laptop_monitor_profile() {
  local refresh="$1"

  cat >"${HYPR_DIR}/monitor-profile-active.lua" <<EOF
hl.monitor({
  output = "desc:Tianma Microelectronics Ltd. TL134ADXP03",
  mode = "2560x1600@${refresh}Hz",
  position = "0x0",
  scale = 1.6
})

hl.monitor({
  output = "desc:Samsung Electric Company LS24D60xU HNAX700460",
  disabled = true
})

hl.monitor({
  output = "desc:LG Electronics 17MT70 509NZLL087136",
  disabled = true
})

hl.monitor({
  output = "desc:GIGA-BYTE TECHNOLOGY CO. LTD. M32UC 24270B001826",
  disabled = true
})
EOF
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

reload_config() {
  hyprctl reload >/dev/null
  sleep 0.5
}

on_battery() {
  for status_file in /sys/class/power_supply/BAT*/power_status /sys/class/power_supply/BAT*/status; do
    if [[ -f "$status_file" ]]; then
      local val
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
  swap_workspace_rules "laptop"

  local refresh
  refresh="$(get_laptop_refresh)"

  write_laptop_monitor_profile "${refresh}"
  reload_config

  for ws in 1 2 3 4 5 6 7 8 9; do
    move_ws_to_monitor "$ws" "$FLOW_DESC"
  done

  monitor_disable "$WORK_DESC"
  monitor_disable "$LG_DESC"
  monitor_disable "$GARAGE_DESC"
  monitor_disable "$GARAGE4K_DESC"

  monitor_enable "$FLOW_DESC" "2560x1600@${refresh}Hz" "0x0" 1.6

  workspace_go "1"
}

apply_lg_alone() {
  set_workspaces_file "${WS_DIR}/workspaces-lg.conf"
  swap_workspace_rules "lg"
  swap_monitor_profile "lg-alone"
  reload_config

  for ws in 1 2 3 4 5 6 7 8 9; do
    move_ws_to_monitor "$ws" "$LG_DESC"
  done

  workspace_go "1"
}

apply_lg_alone_high() {
  set_workspaces_file "${WS_DIR}/workspaces-lg.conf"
  swap_workspace_rules "lg"
  swap_monitor_profile "lg-alone-high"
  reload_config

  for ws in 1 2 3 4 5 6 7 8 9; do
    move_ws_to_monitor "$ws" "$LG_DESC"
  done

  workspace_go "1"
}

apply_lg_above() {
  set_workspaces_file "${WS_DIR}/workspaces-lg.conf"
  swap_workspace_rules "lg"
  swap_monitor_profile "lg-above"
  reload_config

  move_ws_to_monitor "1" "$FLOW_DESC"
  for ws in 2 3 4 5 6 7 8 9; do
    move_ws_to_monitor "$ws" "$LG_DESC"
  done

  workspace_go "1"
}

apply_lg_left() {
  set_workspaces_file "${WS_DIR}/workspaces-lg.conf"
  swap_workspace_rules "lg"
  swap_monitor_profile "garage"
  reload_config

  monitor_disable "$WORK_DESC"
  monitor_disable "$GARAGE_DESC"
  monitor_disable "$GARAGE4K_DESC"

  monitor_enable "$LG_DESC" "2560x1600@59.97" "0x0" 1.6
  monitor_enable "$FLOW_DESC" "2560x1600@180.00" "1600x0" 1.6

  # ws1 to FLOW, ws2-9 to LG
  move_ws_to_monitor "1" "$FLOW_DESC"
  for ws in 2 3 4 5 6 7 8 9; do
    move_ws_to_monitor "$ws" "$LG_DESC"
  done

  workspace_go "1"
}

apply_lg_right() {
  set_workspaces_file "${WS_DIR}/workspaces-lg.conf"
  swap_workspace_rules "lg"
  swap_monitor_profile "garage"
  reload_config

  monitor_disable "$WORK_DESC"
  monitor_disable "$GARAGE_DESC"
  monitor_disable "$GARAGE4K_DESC"

  monitor_enable "$FLOW_DESC" "2560x1600@180.00" "0x0" 1.6
  monitor_enable "$LG_DESC" "2560x1600@59.97" "1600x0" 1.6

  # ws1 to FLOW, ws2-9 to LG
  move_ws_to_monitor "1" "$FLOW_DESC"
  for ws in 2 3 4 5 6 7 8 9; do
    move_ws_to_monitor "$ws" "$LG_DESC"
  done

  workspace_go "1"
}

apply_work() {
  set_workspaces_file "${WS_DIR}/workspaces-work.conf"
  swap_workspace_rules "work"
  swap_monitor_profile "garage"
  reload_config

  monitor_disable "$LG_DESC"
  monitor_disable "$GARAGE_DESC"
  monitor_disable "$GARAGE4K_DESC"

  monitor_enable "$FLOW_DESC" "2560x1600@180.00" "0x0" 1.6
  monitor_enable "$WORK_DESC" "2560x1440@99.95" "0x-1440" 1

  # ws1 to FLOW, ws2-9 to WORK
  move_ws_to_monitor "1" "$FLOW_DESC"
  for ws in 2 3 4 5 6 7 8 9; do
    move_ws_to_monitor "$ws" "$WORK_DESC"
  done

  focus_monitor "$WORK_DESC"
  workspace_go "1"
}

apply_garage() {
  set_workspaces_file "${WS_DIR}/workspaces-garage.conf"
  swap_workspace_rules "garage"
  swap_monitor_profile "garage"
  reload_config

  monitor_disable "$WORK_DESC"
  monitor_disable "$LG_DESC"

  monitor_enable "$FLOW_DESC" "2560x1600@180.00" "0x0" 1.6
  monitor_enable "$GARAGE_DESC" "3840x2160@60" "0x-1350" 1.6

  # ws1 to FLOW, ws2-9 to GARAGE
  move_ws_to_monitor "1" "$FLOW_DESC"
  for ws in 2 3 4 5 6 7 8 9; do
    move_ws_to_monitor "$ws" "$GARAGE_DESC"
  done

  focus_monitor "$GARAGE_DESC"
  workspace_go "2"
}

apply_garage4k() {
  set_workspaces_file "${WS_DIR}/workspaces-garage.conf"
  swap_workspace_rules "garage"
  swap_monitor_profile "garage"
  reload_config

  monitor_disable "$WORK_DESC"
  monitor_disable "$LG_DESC"

  monitor_enable "$FLOW_DESC" "2560x1600@180.00" "0x0" 1.6
  monitor_enable "$GARAGE4K_DESC" "3840x2160@60" "0x-2160" 1

  # ws1 to FLOW, ws2-9 to GARAGE4K
  move_ws_to_monitor "1" "$FLOW_DESC"
  for ws in 2 3 4 5 6 7 8 9; do
    move_ws_to_monitor "$ws" "$GARAGE4K_DESC"
  done

  focus_monitor "$GARAGE4K_DESC"
  workspace_go "2"
}

main() {
  require_profile
  require_tools

  case "$PROFILE" in
  laptop)
    apply_laptop
    ;;
  lg-above)
    apply_lg_above
    ;;
  lg-alone)
    apply_lg_alone
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
