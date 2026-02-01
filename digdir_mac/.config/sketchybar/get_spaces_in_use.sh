#!/usr/bin/env bash

focus_idx=$(yabai -m query --spaces --space | jq '.index')
active_idxs=$(yabai -m query --spaces | jq '.[] | select(."first-window" != 0) | .index')

/Users/sortraev/.config/sketchybar/space_indicator $focus_idx $active_idxs
