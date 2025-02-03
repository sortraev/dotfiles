#!/usr/bin/bash

volume_control() {
  cmd=$1
  if [[ $cmd == "mute" ]]; then
    pactl set-sink-mute @DEFAULT_SINK@ toggle
    pactl set-sink-volume @DEFAULT_SINK@ 0
    return
  elif [[ $cmd == "up" ]]; then
    pactl set-sink-volume @DEFAULT_SINK@ +5%
  elif [[ $cmd == "down" ]]; then
    pactl set-sink-volume @DEFAULT_SINK@ -5%
  elif [[ $cmd == "high" ]]; then
    pactl set-sink-volume @DEFAULT_SINK@ 90%
  elif [[ $cmd == "low" ]]; then
    pactl set-sink-volume @DEFAULT_SINK@ 20%
  else
    return # unrecognized cmd; do nothing.
  fi
  pactl set-sink-mute @DEFAULT_SINK@ 0
}

volume_control $1
