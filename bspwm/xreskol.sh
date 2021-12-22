#!/bin/bash

xrdb ~/.Xresources
xrdb -merge ~/.cache/wal/colors.Xresources
#xrdb -merge <(grep -v "depth" ~/.cache/wal/colors.Xresources | grep -v "background")
#xrdb -merge <(echo "URxvt*background: [70]$(head -n 1 /home/krzych/.cache/wal/colors)")

