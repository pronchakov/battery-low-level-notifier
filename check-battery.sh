#!/bin/bash

battery_level=$(cat /sys/class/power_supply/BAT0/capacity)
battery_status=$(cat /sys/class/power_supply/BAT0/status)

if [ $battery_level -lt 10 ] && [ $battery_status != "Charging" ]; then
  export XDG_RUNTIME_DIR=/run/user/$(id -u)
  notify-send -u critical Battery "Battery charge level is critical."
fi