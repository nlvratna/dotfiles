#!/bin/bash



battery_level=$(cat /sys/class/power_supply/BAT0/capacity) 
status=$(cat /sys/class/power_supply/BAT0/status)

# Check battery level and status
if [[ "$battery_level" -lt 30 ]] && [[ "$status" != "Charging" ]]; then
   notify-send "Keep Charging, you idiot! Battery is at ${battery_level}%" -u critical
fi
# check battery level
