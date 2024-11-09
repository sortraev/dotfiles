#!/bin/bash
#
userresources=$HOME/.Xresources

$HOME/.config/i3/set_kb.sh
xrdb $userresources

exec $HOME/.config/i3/i3_restart_wrapper.sh "start"
