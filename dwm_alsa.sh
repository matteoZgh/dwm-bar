#!/bin/sh

dwm_alsa () {
	STATUS=$(amixer sget Master | tail -n1 | sed -r "s/.*\[(.*)\]/\1/")
    VOL=$(amixer get Master | tail -n1 | sed -r "s/.*\[(.*)%\].*/\1/")
	if [ "$STATUS" = "off" ]; then
			printf "🔇 --%%"
	else
		if [ "$VOL" -le 9 ]; then
			printf "🔈 0%s%%" "$VOL"
		elif [ "$VOL" -gt 9 ] && [ "$VOL" -le 33 ]; then
			printf "🔈 %s%%" "$VOL"
		elif [ "$VOL" -gt 33 ] && [ "$VOL" -le 66 ]; then
			printf "🔉 %s%%" "$VOL"
		else
			printf "🔊 %s%%" "$VOL"
		fi
	fi
}
