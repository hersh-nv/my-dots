#!/usr/bin/env bash
# @Author: hersh
# @Date:   2019-10-20 23:14:07
# @Last Modified by:   hersh
# @Last Modified time: 2019-11-14 01:32:21

chg_percent=$(upower -i $(upower -e | grep Display) | grep --color=never -E percentage|xargs|cut -d' ' -f2 | cut -d'.' -f1)
chg_status=$(upower -i $(upower -e | grep Display) | grep -E state|xargs|cut -d' ' -f2)

if [ "$chg_percent" == "100%" ]; then
	chg_percent=100
fi

if [ "$chg_status" == "charging" ] || [ "$chg_status" == "fully-charged" ]; then
	icon=
elif [ "$chg_percent" -ge 90 ]; then
	icon=
elif [ "$chg_percent" -ge 60 ]; then
	icon=
elif [ "$chg_percent" -ge 40 ]; then
	icon=
elif [ "$chg_percent" -ge 10 ]; then
	icon=
else
  notify-send -u critical -t 30000 "10% battery remaining"
	icon=
fi

echo $icon $chg_percent%
echo $icon $chg_percent%
if [ "$chg_percent" -le 25 ] && [ "$chg_status" == "discharging" ]; then
	echo "#ff8000";
else
	echo "#ffffff";
fi
