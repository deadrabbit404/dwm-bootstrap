#!/bin/bash

wired=`ip a | grep 'enp\|eth0' | grep inet | wc -l`
wifi=`ip a | grep 'wlp\|wlan' | grep inet | wc -l`

network() {
	if [[ $wired = 1 ]]; then
		echo "󰈀"
	elif [[ $wifi = 1 ]]; then
		echo "󰖩"
	else
		echo "󱚼"
	fi
}

echo "$(network)"
