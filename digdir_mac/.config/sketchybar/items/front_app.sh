#!/usr/bin/env bash

sketchybar \
	--add item front_app left \
	--set front_app script="$PLUGIN_DIR/front_app.sh" \
	icon.drawing=off \
	background.height=26 \
	label.color="$WHITE" \
	associated_display=active \
	--subscribe front_app front_app_switched
