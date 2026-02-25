#!/usr/bin/env bash

# make sure it's executable with:
# chmod +x ~/.config/sketchybar/plugins/aerospace.sh

source "$CONFIG_DIR/plugins/colors.sh"

# If the sender is front_app_switched, FOCUSED_WORKSPACE is not passed by aerospace, 
# so we fetch it manually to ensure we highlight the correct workspace.
if [ "$SENDER" = "front_app_switched" ]; then
  FOCUSED_WORKSPACE=$(aerospace list-workspaces --focused)
fi

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
  sketchybar --set $NAME background.drawing=on \
                         background.color=0xffffffff \
                         icon.color=0xff000000 \
                         label.color=0xff000000
else
  sketchybar --set $NAME background.drawing=off \
                         icon.color=0xffffffff \
                         label.color=0xffffffff
fi

# Update icons for the workspace that just changed
apps=$(aerospace list-windows --workspace "$1" | awk -F'|' '{gsub(/^ *| *$/, "", $2); print $2}')
icon_strip=" "
if [ "${apps}" != "" ]; then
  while read -r app; do
    icon_strip+=" $($CONFIG_DIR/plugins/icon_map_fn.sh "$app")"
  done <<<"${apps}"
else
  icon_strip=""
fi
sketchybar --set $NAME label="$icon_strip"
