#!/usr/bin/bash

killall -q polybar
while pgrep -u $UID -x polybar > /dev/null; do sleep 0.5; done

monitors=$(xrandr --listactivemonitors | tail -n +2 | awk '{print $(NF)}')
for monitor in $monitors; do
  echo $MONITOR
  MONITOR=$monitor polybar main &
done
