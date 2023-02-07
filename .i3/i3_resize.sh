#!/usr/bin/bash

[ -z "$1" ] && 1>&2 echo "No direction provided" && exit 1

amount="${2:-128}"

case $1 in
  up)
    i3-msg resize grow up    $amount || i3-msg resize shrink down  $amount
    ;;
  down)
    i3-msg resize grow down  $amount || i3-msg resize shrink up    $amount
    ;;
  left)
    i3-msg resize grow left  $amount || i3-msg resize shrink right $amount
    ;;
  right)
    i3-msg resize grow right $amount || i3-msg resize shrink left  $amount
    ;;
esac
