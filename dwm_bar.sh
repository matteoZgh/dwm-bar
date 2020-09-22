#!/bin/sh

LOC=$(readlink -f "$0")
DIR=$(dirname "$LOC")

. "$DIR/bar-functions/dwm_rainbarf.sh"
. "$DIR/bar-functions/dwm_resources.sh"
. "$DIR/bar-functions/dwm_battery.sh"
. "$DIR/bar-functions/dwm_alsa.sh"
. "$DIR/bar-functions/dwm_date.sh"
#. "$DIR/bar-functions/dwm_weather.sh"

while true; do
	dwm_resources
done &

while true; do
	xsetroot -name " [$(< .resources)] [$(dwm_battery)] [$(dwm_alsa)] [$(dwm_date)] "
	sleep 1
done
