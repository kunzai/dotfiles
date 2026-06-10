#!/usr/bin/env bash
set -euo pipefail

PROFILE="${1:-laptop}"

FLOW_DESC='desc:Tianma Microelectronics Ltd. TL134ADXP03'
LG_DESC='desc:LG Electronics 17MT70 509NZLL087136'
GARAGE_DESC='desc:GIGA-BYTE TECHNOLOGY CO. LTD. M32UC 24270B001826'
WORK_DESC='desc:Samsung Electric Company LS24D60xU HNAX700460'

WS_DIR="${HOME}/.config/ws-monitors"
CURRENT_WS_FILE="${WS_DIR}/workspaces-current.conf"

BATTERY_MODE=false
if hyprctl devices 2>/dev/null | grep -qi battery; then
  BATTERY_MODE=true
fi

Z13_REFRESH="180"
[[ "$BATTERY_MODE" == true ]] && Z13_REFRESH="60"

set_workspaces_file() {
  local src="$1"
  cp "$src" "$CURRENT_WS_FILE"
}

move_existing_workspaces() {
  local external_desc="${1:-}"

  hyprctl dispatch moveworkspacetomonitor 1 "$FLOW_DESC" >/dev/null 2>&1 || true

  if [[ -n "$external_desc" ]]; then
    for ws in 2 3 4 5 6 7 8 9; do
      hyprctl dispatch moveworkspacetomonitor "$ws" "$external_desc" >/dev/null 2>&1 || true
    done
  else
    for ws in 2 3 4 5 6 7 8 9; do
      hyprctl dispatch moveworkspacetomonitor "$ws" "$FLOW_DESC" >/dev/null 2>&1 || true
    done
  fi
}

case "$PROFILE" in
laptop)
  set_workspaces_file "${WS_DIR}/workspaces-laptop.conf"
  hyprctl reload
  sleep 0.2

  hyprctl dispatch moveworkspacetomonitor 1 "$FLOW_DESC" >/dev/null 2>&1 || true
  for ws in 2 3 4 5 6 7 8 9; do
    hyprctl dispatch moveworkspacetomonitor "$ws" "$FLOW_DESC" >/dev/null 2>&1 || true
  done

  sleep 0.2
  hyprctl keyword monitor "$WORK_DESC,disable"
  hyprctl keyword monitor "$LG_DESC,disable"
  hyprctl keyword monitor "$GARAGE_DESC,disable"

  hyprctl keyword monitor "$FLOW_DESC,2560x1600@${Z13_REFRESH},0x0,1.6"
  hyprctl dispatch workspace 1
  ;;

lg-alone)
  set_workspaces_file "${WS_DIR}/workspaces-lg-alone.conf"
  hyprctl reload
  sleep 0.2

  hyprctl dispatch moveworkspacetomonitor 1 "$LG_DESC" >/dev/null 2>&1 || true
  for ws in 2 3 4 5 6 7 8 9; do
    hyprctl dispatch moveworkspacetomonitor "$ws" "$LG_DESC" >/dev/null 2>&1 || true
  done

  sleep 0.2
  hyprctl keyword monitor "$WORK_DESC,disable"
  hyprctl keyword monitor "$FLOW_DESC,disable"
  hyprctl keyword monitor "$GARAGE_DESC,disable"

  hyprctl keyword monitor "$LG_DESC,2560x1600@60,0x0,1.6"
  hyprctl dispatch workspace 1
  ;;

lg-alone-high)
  hyprctl keyword monitor "$WORK_DESC,disable"
  hyprctl keyword monitor "$GARAGE_DESC,disable"
  hyprctl keyword monitor "$LG_DESC,2560x1600@60,0x0,1"
  hyprctl keyword monitor "$FLOW_DESC,disable"

  set_workspaces_file "${WS_DIR}/workspaces-lg.conf"
  hyprctl reload
  for ws in 1 2 3 4 5 6 7 8 9; do
    hyprctl dispatch moveworkspacetomonitor "$ws" "$LG_DESC" >/dev/null 2>&1 || true
  done
  hyprctl dispatch workspace 1
  ;;

lg-left)
  hyprctl keyword monitor "$WORK_DESC,disable"
  hyprctl keyword monitor "$GARAGE_DESC,disable"
  hyprctl keyword monitor "$LG_DESC,2560x1600@60,0x0,1.6"
  hyprctl keyword monitor "$FLOW_DESC,2560x1600@${Z13_REFRESH},1600x0,1.6"

  set_workspaces_file "${WS_DIR}/workspaces-lg.conf"
  hyprctl reload
  move_existing_workspaces "$LG_DESC"
  hyprctl dispatch workspace 1
  ;;

lg-right)
  hyprctl keyword monitor "$WORK_DESC,disable"
  hyprctl keyword monitor "$GARAGE_DESC,disable"
  hyprctl keyword monitor "$FLOW_DESC,2560x1600@${Z13_REFRESH},0x0,1.6"
  hyprctl keyword monitor "$LG_DESC,2560x1600@60,1600x0,1.6"

  set_workspaces_file "${WS_DIR}/workspaces-lg.conf"
  hyprctl reload
  move_existing_workspaces "$LG_DESC"
  hyprctl dispatch workspace 1
  ;;

garage)
  set_workspaces_file "${WS_DIR}/workspaces-garage.conf"
  hyprctl reload
  sleep 0.2

  hyprctl keyword monitor "$WORK_DESC,disable"
  hyprctl keyword monitor "$LG_DESC,disable"
  hyprctl keyword monitor "$GARAGE_DESC,3840x2160@60,0x0,1.6"
  hyprctl keyword monitor "$FLOW_DESC,2560x1600@${Z13_REFRESH},400x1350,1.6"

  move_existing_workspaces "$GARAGE_DESC"
  hyprctl dispatch workspace 1
  ;;

garage4k)
  hyprctl keyword monitor "$WORK_DESC,disable"
  hyprctl keyword monitor "$LG_DESC,disable"
  hyprctl keyword monitor "$GARAGE_DESC,3840x2160@60,0x0,1"
  hyprctl keyword monitor "$FLOW_DESC,2560x1600@${Z13_REFRESH},640x2160,1.6"

  set_workspaces_file "${WS_DIR}/workspaces-garage.conf"
  hyprctl reload
  move_existing_workspaces "$GARAGE_DESC"
  hyprctl dispatch workspace 1
  ;;

work)
  set_workspaces_file "${WS_DIR}/workspaces-garage.conf"
  hyprctl reload
  sleep 0.2

  hyprctl keyword monitor "$LG_DESC,disable"
  hyprctl keyword monitor "$GARAGE_DESC,disable"
  hyprctl keyword monitor "$WORK_DESC,2560x1440@99.95,0x0,1.6"
  hyprctl keyword monitor "$FLOW_DESC,2560x1600@${Z13_REFRESH},0x900,1.6"
  hyprctl dispatch focusmonitor 1 # Samsung fokussieren

  move_existing_workspaces "$WORK_DESC"
  hyprctl dispatch workspace 1
  ;;

*)
  notify-send "Unknown profile: $PROFILE"
  exit 1
  ;;
esac

notify-send "✓ $PROFILE (Z13: ${Z13_REFRESH}Hz @1.6)"
