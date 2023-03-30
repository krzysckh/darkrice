#!/bin/sh

export PATH=$PATH:/home/krzych/bin:/home/krzych/.local/bin:/home/krzych/.cargo/bin
export _JAVA_AWT_WM_NONREPARENTING=1

xrdb ~/.Xresources

xsetroot -cursor_name left_ptr

setxkbmap pl

xset -dpms

[ -z "$(pgrep urxvtd)" ] && urxvtd -q -o -f
[ -z "$(pgrep dunst)" ] && dunst &
[ -z "$(pgrep xbanish)" ] && xbanish &
[ -z "$(pgrep picom)" ] && picom --config "/home/krzych/.config/picom/picom.conf" -b

xwallpaper --center "/home/krzych/Documents/img/wallpaper.png"

# https://raw.githubusercontent.com/krzysckh/bin/master/samelines.pl
fortune 30% archlinux 40% linux 30% perl \
	| cowsay \
	| samelines.pl \
	| convert -size 1920x1200 -gravity center -background "#2b3339" \
	-fill "#a7c080" -pointsize 15 \
	-font 'agave-regular-Nerd-Font-Complete' label:@- /tmp/wall.png
xwallpaper --maximize /tmp/wall.png

pgrep status_inf | xargs kill -9


case "$(cat /tmp/_RUN_WM)" in
	"bspwm")
		bspwm
		;;
	"cwm")
		cwm
		;;
	"dwm")
		status_inf &
		dwm
		;;
esac

