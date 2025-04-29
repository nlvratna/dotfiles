#!/usr/bin/env bash

TOUCHPAD_ID_SWAY="1267:12541:ELAN071A:00_04F3:30FD_Touchpad"
MOUSE_ID_PREFIX_SWAY="7847"

TOUCHPAD_NAME_HYPR="elan071a:00-04f3:30fd-touchpad"
MOUSE_NAME_HYPR="2.4g-mouse-1"

# Determine compositor
if [ "$XDG_CURRENT_DESKTOP" = "sway" ]; then
  BACKEND="sway"
elif [ "$XDG_CURRENT_DESKTOP" = "Hyprland" ]; then
  BACKEND="hyprland"
else
  echo "Unsupported compositor: $XDG_CURRENT_DESKTOP"
  exit 1
fi

while true; do
  if [ "$BACKEND" = "sway" ]; then
    if swaymsg -t get_inputs | grep -q "$MOUSE_ID_PREFIX_SWAY"; then
      swaymsg input "$TOUCHPAD_ID_SWAY" events disabled
    else
      swaymsg input "$TOUCHPAD_ID_SWAY" events enabled
    fi
  elif [ "$BACKEND" = "hyprland" ]; then
    if hyprctl devices | grep -i "$MOUSE_NAME_HYPR" >/dev/null; then
      # External mouse connected, disable touchpad
      hyprctl keyword "device["$TOUCHPAD_NAME_HYPR"]:enabled" false
    else
      # External mouse not connected, enable touchpad
      hyprctl keyword "device["$TOUCHPAD_NAME_HYPR"]:enabled" true
    fi
  fi
  sleep 5
done
