#!/usr/bin/env bash


# MOUSE_NAME_HYPR="2.4g-mouse-1"
# TOUCHPAD_NAME_HYPR="elan071a:00-04f3:30fd-touchpad"
#
# while true; do
#     if hyprctl devices | grep -i "$MOUSE_NAME_HYPR" >/dev/null; then
#       hyprctl keyword "device[$TOUCHPAD_NAME_HYPR]:enabled" false
#     else
#       hyprctl keyword "device[$TOUCHPAD_NAME_HYPR]:enabled" true
#     fi
#   sleep 5
# done


TOUCHPAD_ID="1267:12541:ELAN071A:00_04F3:30FD_Touchpad"
MOUSE_ID="7847:102:2.4G_Mouse"

while true; do
    if swaymsg -t get_inputs | grep -q "$MOUSE_ID"; then
        swaymsg input "$TOUCHPAD_ID" events disabled
    else
        swaymsg input "$TOUCHPAD_ID" events enabled
    fi
    sleep 5
done
