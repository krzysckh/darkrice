#!/bin/sh

export PATH=$PATH:/home/krzych/bin:/home/krzych/.local/bin

xrdb ~/.Xresources

xsetroot -cursor_name left_ptr

setxkbmap pl

[ -z "$(pgrep dunst)" ] && dunst &
[ -z "$(pgrep xbanish)"] && xbanish &
[ -z "$(pgrep picom)" ] && picom --config "/home/krzych/.config/picom/picom.conf" -b

( sleep 1 && gwall "#222" "#111" 5 ) &

case "$(cat /tmp/_RUN_WM)" in
	"bspwm")
		bspwm
		;;
	"cwm")
		cwm
		;;
	"dwm")
		dwm
		;;
esac

