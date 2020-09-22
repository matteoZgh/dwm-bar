#!/bin/sh

dwm_weather () {
	LOCATION=Harbin
	echo $(curl -s "wttr.in/$LOCATION?format=1") > .weather
}
