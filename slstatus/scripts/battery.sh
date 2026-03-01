#!/bin/bash
#
status=$(cat /sys/class/power_supply/BAT0/status)
capacity=$(cat /sys/class/power_supply/BAT0/capacity)

if [[ $status == "Charging" ]]; then
  if [[ $capacity -le "1" ]]; then
    symbol="󰢟"
  elif [[ $capacity -le "10" ]]; then
    symbol="󰢜"
  elif [[ $capacity -le "20" ]]; then
    symbol="󰂆"
  elif [[ $capacity -le "30" ]]; then
    symbol="󰂇"
  elif [[ $capacity -le "40" ]]; then
    symbol="󰂈"
  elif [[ $capacity -le "50" ]]; then
    symbol="󰢝"
  elif [[ $capacity -le "60" ]]; then
    symbol="󰂉"
  elif [[ $capacity -le "70" ]]; then
    symbol="󰢞"
  elif [[ $capacity -le "80" ]]; then
    symbol="󰂊"
  elif [[ $capacity -le "90" ]]; then
    symbol="󰂋"
  elif [[ $capacity -le "100" ]]; then
    symbol="󰂅"
  fi
else
  if [[ $capacity -le "5" ]]; then
    symbol="󰂎"
  elif [[ $capacity -le "10" ]]; then
    symbol="󰁺"
  elif [[ $capacity -le "20" ]]; then
    symbol="󰁻"
  elif [[ $capacity -le "30" ]]; then
    symbol="󰁼"
  elif [[ $capacity -le "40" ]]; then
    symbol="󰁽"
  elif [[ $capacity -le "50" ]]; then
    symbol="󰁾"
  elif [[ $capacity -le "60" ]]; then
    symbol="󰁿"
  elif [[ $capacity -le "70" ]]; then
    symbol="󰂀"
  elif [[ $capacity -le "80" ]]; then
    symbol="󰂁"
  elif [[ $capacity -le "90" ]]; then
    symbol="󰂂"
  else
    symbol="󰁹"
  fi
fi

case $status in
  "Discharging")
    echo "$symbol $capacity%"
    ;;
  "Charging"|"Not charging"|"Full")
    echo "$symbol $capacity% ($status)"
    ;;
  *)
    echo ""
    ;;
esac
