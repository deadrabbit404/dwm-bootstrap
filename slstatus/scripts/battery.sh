#!/bin/sh

# Find the first battery
BAT=""
for dev in /sys/class/power_supply/*; do
    [ -f "$dev/type" ] || continue
    [ "$(cat "$dev/type")" = "Battery" ] || continue
    BAT="$dev"
    break
done

# No battery (desktop PC)
[ -n "$BAT" ] || exit 0

status=$(cat "$BAT/status")
capacity=$(cat "$BAT/capacity")

if [ "$status" = "Charging" ]; then
    if [ "$capacity" -le 1 ]; then
        symbol="󰢟"
    elif [ "$capacity" -le 10 ]; then
        symbol="󰢜"
    elif [ "$capacity" -le 20 ]; then
        symbol="󰂆"
    elif [ "$capacity" -le 30 ]; then
        symbol="󰂇"
    elif [ "$capacity" -le 40 ]; then
        symbol="󰂈"
    elif [ "$capacity" -le 50 ]; then
        symbol="󰢝"
    elif [ "$capacity" -le 60 ]; then
        symbol="󰂉"
    elif [ "$capacity" -le 70 ]; then
        symbol="󰢞"
    elif [ "$capacity" -le 80 ]; then
        symbol="󰂊"
    elif [ "$capacity" -le 90 ]; then
        symbol="󰂋"
    else
        symbol="󰂅"
    fi
else
    if [ "$capacity" -le 5 ]; then
        symbol="󰂎"
    elif [ "$capacity" -le 10 ]; then
        symbol="󰁺"
    elif [ "$capacity" -le 20 ]; then
        symbol="󰁻"
    elif [ "$capacity" -le 30 ]; then
        symbol="󰁼"
    elif [ "$capacity" -le 40 ]; then
        symbol="󰁽"
    elif [ "$capacity" -le 50 ]; then
        symbol="󰁾"
    elif [ "$capacity" -le 60 ]; then
        symbol="󰁿"
    elif [ "$capacity" -le 70 ]; then
        symbol="󰂀"
    elif [ "$capacity" -le 80 ]; then
        symbol="󰂁"
    elif [ "$capacity" -le 90 ]; then
        symbol="󰂂"
    else
        symbol="󰁹"
    fi
fi

case "$status" in
    Discharging)
        printf "%s %s%%\n" "$symbol" "$capacity"
        ;;
    Charging|Full|Not\ charging)
        printf "%s %s%% (%s)\n" "$symbol" "$capacity" "$status"
        ;;
esac
