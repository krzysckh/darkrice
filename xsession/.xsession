#!/bin/sh

export PLAN9=/home/kpm/nmojeprogramy/plan9port
export PATH=$PATH:/home/kpm/bin:/home/kpm/.local/bin:/home/kpm/.cargo/bin:/opt/flutter/bin:/opt/cosmo/bin:/sbin:$PLAN9/bin:/home/kpm/go/bin

export _JAVA_AWT_WM_NONREPARENTING=1

xrdb ~/.Xresources

xsetroot -cursor_name left_ptr

setxkbmap pl

xset -dpms

[ -z "$(pgrep urxvtd)" ] && urxvtd -q -o -f
[ -z "$(pgrep dunst)" ] && dunst &
[ -z "$(pgrep xbanish)" ] && xbanish &
[ -z "$(pgrep redshift)" ] && redshift -l 50:20 &

xwallpaper --center "/home/kpm/Documents/img/wallpaper.png"

# https://raw.githubusercontent.com/krzysckh/bin/master/samelines.pl
fortune \
  | cowsay \
  | samelines.pl \
  | convert -size 1920x1200 -gravity center -background "#2b3339" \
  -fill "#a7c080" -pointsize 15 \
  -font 'lilex' label:@- /tmp/wall.png
xwallpaper --maximize /tmp/wall.png

pgrep status_inf | xargs kill -9


status_inf &
dwm

