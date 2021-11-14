#!/bin/bash

import -window root 0scr.png
convert 0scr.png -blur 25,5 0scr.png

i3lock -i 0scr.png

rm 0scr.png
