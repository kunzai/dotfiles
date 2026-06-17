#!/bin/bash
# ~/.local/bin/trackpad-auto.sh

DEVICE="asustek-computer-inc.-gz302ea-keyboard-touchpad"
TIMEOUT=5
TIMER_PID=""

enable_tp() { hyprctl keyword "device[$DEVICE]:enabled" true 2>/dev/null; }
disable_tp() { hyprctl keyword "device[$DEVICE]:enabled" false 2>/dev/null; }

reset_timer() {
  [ -n "$TIMER_PID" ] && kill "$TIMER_PID" 2>/dev/null
  (sleep "$TIMEOUT" && enable_tp) &
  TIMER_PID=$!
}

libinput debug-events 2>/dev/null | while read -r line; do
  if echo "$line" | grep -q "KEYBOARD_KEY.*pressed"; then
    disable_tp
    reset_timer
  fi
done
