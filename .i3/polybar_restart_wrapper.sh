#!/usr/bin/bash

# kill any existing polybar instances.
killall -q polybar
# # wait for them to actually die.
while pgrep -x polybar > /dev/null; do sleep 0.1; done
# # init new polybar
polybar main & disown
