#!/usr/bin/bash

mute_status=$(amixer get Master | egrep -oh "(\[off\]|\[on\])")

if [[ $mute_status == "[on]" ]]; then
  amixer -q set Master    mute
  amixer -q set Headphone mute
  amixer -q set Speaker   mute
elif [[ $mute_status == "[off]" ]]; then
  amixer -q set Master    unmute
  amixer -q set Headphone unmute
  amixer -q set Speaker   unmute
  amixer -q set Headphone 100%
  amixer -q set Speaker   100%
fi
