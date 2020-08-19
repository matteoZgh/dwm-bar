#!/bin/sh

dwm_resources () {
    MEMUSED=$(free -h | awk '(NR == 2) {print $3}')
    MEMTOT=$(free -h | awk '(NR == 2) {print $2}')
    CPU=$(sar -u 1 1 | grep Average | awk '{printf $3}')

    printf "💻 MEM %s/%s CPU %s%%" "$MEMUSED" "$MEMTOT" "$CPU"
}

dwm_alsa () {
	STATUS=$(amixer sget Master | tail -n1 | sed -r "s/.*\[(.*)\]/\1/")
    VOL=$(amixer get Master | tail -n1 | sed -r "s/.*\[(.*)%\].*/\1/")
	if [ "$STATUS" = "off" ]; then
			printf "🔇 --%%"
	else
		if [ "$VOL" -gt 0 ] && [ "$VOL" -le 33 ]; then
			printf "🔈 %s%%" "$VOL"
		elif [ "$VOL" -gt 33 ] && [ "$VOL" -le 66 ]; then
			printf "🔉 %s%%" "$VOL"
		else
			printf "🔊 %s%%" "$VOL"
		fi
	fi
}

dwm_date () {
    printf " %s" "$(date "+%Y.%m.%d %H:%M")"
}

dwm_sysline () {
	rainstr=$(rainbarf)
	r1=$(echo $rainstr | cut -d ] -f 2 | cut -d '#' -f 1)
	r2=$(echo $rainstr | cut -d ] -f 3 | cut -d '#' -f 1)
	r3=$(echo $rainstr | cut -d ] -f 4 | cut -d '#' -f 1)
	r4=$(echo $rainstr | cut -d ] -f 5 | cut -d '#' -f 1)
	r5=$(echo $rainstr | cut -d ] -f 6 | cut -d '#' -f 1)
	printf "%s" "$r1$r2$r3$r4$r5"
}

P=" "
xsetroot -name "$P$(dwm_sysline)$P$(dwm_resources)$P$(dwm_alsa)$P$(dwm_date)$P"
