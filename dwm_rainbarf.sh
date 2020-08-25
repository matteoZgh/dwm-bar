#!/bin/sh

dwm_rainbarf() {
	rainstr=$(rainbarf)
	r1=$(echo $rainstr | cut -d] -f2 | cut -d'#' -f1)
	r2=$(echo $rainstr | cut -d] -f3 | cut -d'#' -f1)
	r3=$(echo $rainstr | cut -d] -f4 | cut -d'#' -f1)
	r4=$(echo $rainstr | cut -d] -f5 | cut -d'#' -f1)
	r5=$(echo $rainstr | cut -d] -f6 | cut -d'#' -f1)
	echo "x4"$r1"x5"$r2"x6"$r3"x7"$r4"x8"$r5"x1"
}
