#!/usr/bin/env bash

sketchybar --set "$NAME" label="cpu $(ps -A -o %cpu | awk '{s+=$1; n+=$1>0} END {s /= n} END {printf "%.1f%%\n", s}')"
