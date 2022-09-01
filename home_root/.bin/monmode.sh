#!/bin/bash

if [[ $UID != 0 ]]; then
    echo "This must be run as root."
    exit 1
fi

if [[ $1 = "monitor" ]]; then
	echo "Enabling monitor mode for $2"
	ip link set $2 state down
#	ip link set $2 name wmon0
#	ip link set wmon0 promisc on
	iw dev wmon0 set type monitor
	ip link set $2 state up
	exit 0
fi

if [[ $1 = "managed" ]]; then
	echo "Disabling monitor mode for $2"
	ip link set $2 state down
	iw dev $2 set type managed
	#iwconfig $2 mode managed
	ip link set $2 state up
	exit 0
fi
