#!/usr/bin/bash

base=~/Pictures/Screenshots/$(date +%d-%m-%y_%H:%M:%S)
maim $base\_`ls $base*png 2> /dev/null | wc -l`.png
