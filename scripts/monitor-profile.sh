#!/usr/bin/env bash
set -e

PROFILE="${1:-laptop}"
BATTERY_MODE=false

if hyprctl devices 2>/dev/null | grep -qi battery; then
  BATTERY_MODE=true
fi

Z13_REFRESH="180"
[[ "$BATTERY_MODE" == true ]] && Z13_REFRESH="60"

case "$PROFILE" in
laptop)
  hyprctl keyword monitor "desc:GIGA-BYTE TECHNOLOGY CO. LTD. M32UC 24270B001826,disable"
  hyprctl keyword monitor "desc:Tianma Microelectronics Ltd. TL134ADXP03,2560x1600@${Z13_REFRESH},0x0,1.6"
  ;;
lg-alone)
  hyprctl keyword monitor "desc:LG Electronics 17MT70 509NZLL087136,2560x1600@60,0x0,1.6"
  hyprctl keyword monitor "desc:Tianma Microelectronics Ltd. TL134ADXP03,disable"
  ;;
lg-left)
  hyprctl keyword monitor "desc:LG Electronics 17MT70 509NZLL087136,2560x1600@60,0x0,1.6"
  hyprctl keyword monitor "desc:Tianma Microelectronics Ltd. TL134ADXP03,2560x1600@${Z13_REFRESH},1600x0,1.6"
  ;;
lg-right)
  hyprctl keyword monitor "desc:Tianma Microelectronics Ltd. TL134ADXP03,2560x1600@${Z13_REFRESH},0x0,1.6"
  hyprctl keyword monitor "desc:LG Electronics 17MT70 509NZLL087136,2560x1600@60,1600x0,1.6"
  ;;
garage)
  hyprctl --batch "
    keyword monitor 'desc:GIGA-BYTE TECHNOLOGY CO. LTD. M32UC 24270B001826,3840x2160@60,0x0,1.6'
    keyword monitor 'desc:Tianma Microelectronics Ltd. TL134ADXP03,2560x1600@${Z13_REFRESH},400x1350,1.6'
    "
  ;;
garage4k)
  hyprctl keyword monitor "desc:GIGA-BYTE TECHNOLOGY CO. LTD. M32UC 24270B001826,3840x2160@60,0x0,1"
  hyprctl keyword monitor "desc:Tianma Microelectronics Ltd. TL134ADXP03,2560x1600@${Z13_REFRESH},0x2160,1.6,transform,0"
  ;;
work)
  hyprctl --batch "
    keyword monitor 'desc:Samsung Electric Company LS24D60xU HNAX700460,preferred,0x0,1'
    keyword monitor 'desc:Tianma Microelectronics Ltd. TL134ADXP03,2560x1600@${Z13_REFRESH},480x1440,1.6'
    "
  ;;
*)
  notify-send "Unknown: $PROFILE"
  exit 1
  ;;
esac

notify-send "✓ $PROFILE (Z13: ${Z13_REFRESH}Hz @1.6)"
