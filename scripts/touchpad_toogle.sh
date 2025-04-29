#!/usr/bin/env bash


TOUCHPAD_NAME_HYPR="elan071a:00-04f3:30fd-touchpad"
MOUSE_NAME_HYPR="2.4g-mouse-1"

while true; do
    if hyprctl devices | grep -i "$MOUSE_NAME_HYPR" >/dev/null; then
        echo "here"
      hyprctl keyword "device[$TOUCHPAD_NAME_HYPR]:enabled" false
    else
      hyprctl keyword "device[$TOUCHPAD_NAME_HYPR]:enabled" true
    fi
  sleep 5
done
