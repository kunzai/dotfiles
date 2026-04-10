#!/usr/bin/env bash

# Show a menu and store the choice
CHOICE=$(printf "💻 Laptop\n📺 LG Left\n📺 LG Right\n🚗 Garage\n💼 Work" | fuzzel --dmenu -p "Monitor Layout: " -l 5)

# Run the corresponding profile
case "$CHOICE" in
"💻 Laptop") ~/.local/bin/monitor-profile.sh laptop ;;
"📺 LG alone") ~/.local/bin/monitor-profile.sh lg-alone ;;
"📺 LG Left") ~/.local/bin/monitor-profile.sh lg-left ;;
"📺 LG Right") ~/.local/bin/monitor-profile.sh lg-right ;;
"🚗 Garage") ~/.local/bin/monitor-profile.sh garage ;;
"🚗 Garage4K") ~/.local/bin/monitor-profile.sh garage4k ;;
"💼 Work") ~/.local/bin/monitor-profile.sh work ;;
esac
