#!/bin/bash

export PATH=/usr/bin:/bin:/usr/local/bin


OPTIONS="  shutdown
  reboot
  logout"

CHOICE=$(echo -e "$OPTIONS" | wofi --dmenu --prompt "Power" --lines=3)
CHOICE=$(echo "$CHOICE" | xargs)  # Trim leading/trailing spaces

case "$CHOICE" in
    " shutdown") systemctl poweroff ;;
    " reboot")   systemctl reboot ;;
    " logout")   hyprctl dispatch exit ;;
    *) echo "No match: '$CHOICE'" ;;
esac
