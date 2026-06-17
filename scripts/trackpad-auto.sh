#!/usr/bin/env bash

DEVICE="asustek-computer-inc.-gz302ea-keyboard-touchpad"
TIMEOUT=1.5
TIMER_PID=""

enable_tp() {
  hyprctl keyword "device[$DEVICE]:enabled" true >/dev/null 2>&1
}

disable_tp() {
  hyprctl keyword "device[$DEVICE]:enabled" false >/dev/null 2>&1
}

reset_timer() {
  if [ -n "$TIMER_PID" ]; then
    kill "$TIMER_PID" >/dev/null 2>&1 || true
  fi

  (
    sleep "$TIMEOUT"
    enable_tp
  ) &
  TIMER_PID=$!
}

sudo libinput debug-events --udev seat0 2>/dev/null | while read -r line; do
  case "$line" in
  *KEYBOARD_KEY*pressed*)
    disable_tp
    reset_timer
    ;;
  esac
done
