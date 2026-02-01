#!/usr/bin/env bash

source "$HOME/.config/sketchybar/variables.sh" # Loads all defined colors

SPACE_ICONS=("1" "2" "3" "4" "y" "u" "i" "o" "9")

color="$WHITE"
if [ "$SELECTED" == "true" ]; then
	color="$RED"
else
	
	first_window=$(yabai -m query --spaces --space $SID | jq '.["first-window"]')
	if [[ $first_window == "0" ]]; then
		color="$BLACK"
	fi
fi

sketchybar --set "$NAME" \
	icon="${SPACE_ICONS[$SID - 1]}" \
	icon.color=$color
