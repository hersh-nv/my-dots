#!/usr/bin/env bash
# @Author: hersh
# @Date:   2019-10-27 12:42:15
# @Last Modified by:   hersh
# @Last Modified time: 2019-10-27 12:55:05

sink=$(pactl info | grep Sink | cut -d':' -f2)
if [[ $(echo $sink | grep hdmi) ]]; then
  sinko=HDMI
elif [[ $(echo $sink | grep bluez) ]]; then
  sinko=BT
elif [[ $(echo $sink | grep analog) ]]; then
  sinko=ANA
elif [[ $(echo $sink | grep usb) ]]; then
  sinko=USB
#else
#  sinko=''
fi

volume=$(pactl list sinks | grep "Name:$sink" -A 8 | egrep -o "[0-9]+%" | head -n 1 | sed s/%//)

if [[ $(pactl list sinks | grep "Name:$sink" -A 8 | egrep "Mute" | cut -d' ' -f2) == "yes" ]]; then
	icon=
elif [ $volume -eq 0 ]; then
	icon=
elif [ $volume -lt 60 ]; then
	icon=
else
	icon=
fi

echo $icon $volume% $sinko
