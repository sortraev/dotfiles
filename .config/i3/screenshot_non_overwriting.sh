#!/usr/bin/bash

if [ "$#" -ne 1 ]; then
  exit 1;
fi

base=~/Pictures/Screenshots/$(date +%d-%m-%y_%H:%M:%S)
out_filename=$base\_`ls $base*png 2> /dev/null | wc -l`.png

arg="$1"
if [ $arg = "fullscreen" ]; then
  maim $out_filename
elif [ $arg = "active_window" ]; then
  maim --hidecursor -i $(xdotool getactivewindow) $out_filename
elif [ $arg = "snippet" ]; then
  maim --hidecursor -s $out_filename
elif [ $arg = "snippet_to_clipboard" ]; then
  maim --hidecursor -s | xclip -selection clipboard -t image/png
fi
