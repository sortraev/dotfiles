#!/usr/bin/env bash

BATT_STATUS=$(pmset -g batt)
PERCENTAGE=$(grep -Eo "\d+%" <<< $BATT_STATUS)

if [ "$PERCENTAGE" = "" ]; then
	exit 0
fi

label="batt $PERCENTAGE"

if [[ "$BATT_STATUS" =~ "AC Power" ]]; then
	label+=" ++"
else
	label+=" --"
fi

sketchybar --set "$NAME" label="$label"
