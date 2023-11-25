#!/bin/bash

killall -q polybar

while pgrep -u $UID -x picom >/dev/null; do sleep 1; done

polybar example &

echo "Polybar is loading..."
