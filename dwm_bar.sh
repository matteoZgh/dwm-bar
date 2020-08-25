#!/bin/sh

LOC=$(readlink -f "$0")
DIR=$(dirname "$LOC")

. "$DIR/dwm_rainbary.sh"
. "$DIR/dwm_resources.sh"
. "$DIR/dwm_alsa.sh"
. "$DIR/dwm_date.sh"

while true; do
	dwm_resources
done &

while true; do
	xsetroot -name "$(dwm_rainbary) $(< .resources) $(dwm_alsa) $(dwm_date)"
done
