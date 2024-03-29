#!/bin/bash

# TODO::fix this

# low battery in %
LOW_BATTERY="15"
# critical battery in % (execute action)
CRITICAL_BATTERY="10"
# action
ACTION="/sbin/poweroff"
# display icon
ICON="/opt/icons/battery-low-icon.png"
# path to battery /sys
BATTERY_PATH="/sys/class/power_supply/BAT1/"


if [ -e "$BATTERY_PATH" ]; then
    BATTERY_ON=$(cat $BATTERY_PATH/status)

    if [ "$BATTERY_ON" == "Discharging" ]; then
        CURRENT_BATTERY=$(cat $BATTERY_PATH/capacity)

        if [ "$CURRENT_BATTERY" -lt "$CRITICAL_BATTERY" ]; then
            $($ACTION)

        elif [ "$CURRENT_BATTERY" -lt "$LOW_BATTERY" ]; then
            notify-send -i "$ICON"  "Battery IS low - $CURRENT_BATTERY %."
        fi
    fi
fi
