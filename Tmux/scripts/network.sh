#!/usr/bin/env bash

IFACE=$(ip route get 8.8.8.8 2>/dev/null | awk '{print $5; exit}')

if [ -z "$IFACE" ]; then
    echo "󰖪"
    exit
fi

if [[ "$IFACE" == wl* ]]; then
    SSID=$(iwgetid -r 2>/dev/null)
    echo "󰖩 ${SSID:-wifi}"
elif [[ "$IFACE" == en* || "$IFACE" == eth* ]]; then
    echo "󰈀 eth"
else
    echo "󰛳 $IFACE"
fi
