#!/bin/bash
#
vol=$(pamixer --get-volume)
muted=$(pamixer --get-mute)

if [[ $muted == true ]]; then
  echo " muted"
else
  echo " $vol%"
fi
