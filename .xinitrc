#!/bin/bash
#
userresources=$HOME/.Xresources

$HOME/.i3/set_kb.sh
xrdb $userresources

exec $HOME/.i3/i3_restart_wrapper.sh "start"
