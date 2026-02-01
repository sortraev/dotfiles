#!/usr/bin/env bash

COLOR="$GREEN"

sketchybar --add item battery right \
	--set battery \
	update_freq=60 \
	label.padding_right=10 \
	label.color="$COLOR" \
	background.height=26 \
	background.corner_radius="$CORNER_RADIUS" \
	background.padding_right=5 \
	background.border_width="$BORDER_WIDTH" \
	background.border_color="$COLOR" \
	background.drawing=on \
	script="$PLUGIN_DIR/battery_status.sh" \
	--subscribe battery power_source_change
