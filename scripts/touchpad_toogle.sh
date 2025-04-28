#!/usr/bin/env bash

TOUCHPAD_ID="1267:12541:ELAN071A:00_04F3:30FD_Touchpad"
MOUSE_ID_PREFIX="7847"

while true; do
  if swaymsg -t get_inputs | grep -q "$MOUSE_ID_PREFIX"; then
    swaymsg input "$TOUCHPAD_ID" events disabled
  else
    swaymsg input "$TOUCHPAD_ID" events enabled
  fi
  sleep 5
done
