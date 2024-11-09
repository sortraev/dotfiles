#!/bin/bash

setxkbmap -layout us -variant altgr-intl # -option caps:escape
# let the caps lock key emit control, but disable left control (ie. don't place
# caps lock on the left control key).
setxkbmap -option ctrl:nocaps

# xmodmap -e "keycode 9 = Escape Escape Escape Escape Escape Escape"

# map left Control to Escape.
xmodmap -e "keycode 37 = Escape Escape Escape Escape Escape Escape"


# a couple of nice-to-haves.
xmodmap -e "keycode 49 = grave acute NoSymbol NoSymbol dead_grave dead_acute"
xmodmap -e "keycode 51 = ampersand bar ampersand bar asciicircum"
xmodmap -e "keycode 94 = backslash asciitilde NoSymbol NoSymbol dead_diaeresis"

# æ, ø, and å on altGr + quote, ampersand, bracketleft.
xmodmap -e "keycode 34 = bracketleft braceleft bracketleft braceleft aring Aring"
xmodmap -e "keycode 47 = semicolon colon semicolon colon ae AE"
xmodmap -e "keycode 48 = apostrophe quotedbl apostrophe quotedbl oslash Oslash"

# map AltGr+{h, j, k, l} to arrow keys.
xmodmap -e "keycode  43 = h H h H Left H h H"
xmodmap -e "keycode  44 = j J j J Down Idiaeresis idiaeresis Idiaeresis"
xmodmap -e "keycode  45 = k K k K Up OE oe OE"
xmodmap -e "keycode  46 = l L l L Right Oslash oslash Oslash"

# same as above, but for WASD
# xmodmap -e "keycode  25 = w W w W Up Aring aring Aring w W aring Aring"
# xmodmap -e "keycode  38 = a A a A Left Aacute aacute Aacute a A aacute Aacute"
# xmodmap -e "keycode  39 = s S s S Down section ssharp section s S ssharp section"
# xmodmap -e "keycode  40 = d D d D Right ETH eth ETH d D eth ETH"

# has nothing to do with keyboard layout, but important nonetheless.
xset r rate 220 50
