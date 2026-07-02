#!/bin/sh

wired=0
wifi=0

for iface in /sys/class/net/*; do
  read state <"$iface/operstate"
  [ "$state" = "up" ] || continue

  name=$(basename "$iface")

  case "$name" in
  wl*)
    wifi=1
    ;;
  en* | eth*)
    wired=1
    ;;
  esac
done

if [ "$wired" -eq 1 ]; then
  echo "󰌘"
elif [ "$wifi" -eq 1 ]; then
  echo "󰖩"
else
  echo "󰌙"
fi
