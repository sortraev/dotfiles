#!/usr/bin/bash

if [[ $1 == "start" ]]; then
  exec i3
fi

configs_dir=$HOME/.config/i3/configs
config=$HOME/.config/i3/config
backup=$config.bk

chmod +w   $backup
cp $config $backup
chmod -w   $backup

echo $config

cat $configs_dir/first.conf              > $config  # stuff to be executed before everything else
cat $configs_dir/colors.conf            >> $config  # i3 specific colors (status bar and border colors)
cat $configs_dir/i3_modes.conf          >> $config  # "gaps", "resize", and "system" modes
cat $configs_dir/ws_and_wm.conf         >> $config  # workspaces and window managing
cat $configs_dir/misc_bindsyms.conf     >> $config  # misc bindsyms (program launching etc)
cat $configs_dir/app_specifics.conf     >> $config  # settings specific to different programs, such as choosing which programs open in floating mode.
cat $configs_dir/statusbar.conf         >> $config  # i3bar stuff. comment when using polybar.
cat $configs_dir/last.conf              >> $config  # stuff to be executed after everything else

exec i3 restart

# if [[ $1 == "start" ]]; then
#   i3
# else
#   i3 restart
# fi
# temporary hack

## kill any existing polybar instances.
# killall -q polybar
## wait for them to actually die.
# while pgrep -x polybar > /dev/null; do sleep 0.1; done
## init new polybar
# polybar main & disown
