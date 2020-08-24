#!/bin/sh

dwm_resources () {
    MEMUSED=$(free -h | awk '(NR == 2) {print $3}')
    MEMTOT=$(free -h | awk '(NR == 2) {print $2}')
    CPU=$(sar -u 1 1 | grep Average | awk '{printf $3}')

	if [ $(echo "$CPU < 10" | bc) -eq 1 ]; then
		CPU="0"$CPU
	fi

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
	printf " %s  %s" "$(date +%Y.%m.%d)" "$(date +%H:%M)"
}

dwm_rainbary() {
	rainstr=$(rainbarf)
	r1=$(echo $rainstr | cut -d] -f2 | cut -d'#' -f1)
	r2=$(echo $rainstr | cut -d] -f3 | cut -d'#' -f1)
	r3=$(echo $rainstr | cut -d] -f4 | cut -d'#' -f1)
	r4=$(echo $rainstr | cut -d] -f5 | cut -d'#' -f1)
	r5=$(echo $rainstr | cut -d] -f6 | cut -d'#' -f1)
	printf "x4%sx5%sx6%sx7%sx8%sx1" "$r1" "$r2" "$r3" "$r4" "$r5"
}

xsetroot -name "$(dwm_rainbary) $(dwm_resources) $(dwm_alsa) $(dwm_date)"
