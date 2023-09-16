#!/bin/bash

if [[ $EUID == 0 ]]; then
  echo ">> Please do nut run as root :)"
  exit
fi

# the (sub)directories in this dotfiles repo, except for _root, are structured
# relative to $HOME. the contents of _root should be pasted to `/`.


# $HOME/.config stuff.
mkdir -p .config
cp -r $HOME/.config/dunst           .config/
cp -r $HOME/.config/nemo            .config/
cp -r $HOME/.config/nvim            .config/
cp -r $HOME/.config/picom           .config/
cp -r $HOME/.config/polybar         .config/
# cp -r $HOME/.config/pulse           .config/
cp -r $HOME/.config/rofi            .config/
cp -r $HOME/.config/zathura         .config/
cp -r $HOME/.config/mimeapps.list   .config/
cp -r $HOME/.config/pavucontrol.ini .config/


# i3 config.
cp -r $HOME/.i3 .


# zsh, including `sortraev theme` (no plugins -- assume these are stored in
# .zshrc).
cp $HOME/.zshrc .
mkdir -p .oh-my-zsh/themes
cp -r $HOME/.oh-my-zsh/themes/sortraev.zsh-theme .


# misc (probably not all of these are even in use).
cp $HOME/.bashrc     .
cp $HOME/.dir_colors .
cp $HOME/.gitconfig  .
cp $HOME/.gvimrc     .
cp $HOME/.Xresources .
cp $HOME/.xinitrc .


# system stuff (everything in _root should simply be installed using
# sudo cp -r _root /.
# TODO: is anything missing?
_root=./Root
mkdir -p $_root/systemd/system/
mkdir -p $_root/etc/udev/rules.d

cp /etc/systemd/system/usb-auto-mount@.service $_root/systemd/system/usb-auto-mount@.service
cp /etc/udev/rules.d/90-backlight.rules        $_root/etc/udev/rules.d/90-backlight.rules
cp /etc/udev/rules.d/99-usb-auto-mount.rules   $_root/etc/udev/rules.d/99-usb-auto-mount.rules
