#!/usr/bin/env bash
#
# @Author: hersh
# @Date:   2019-12-23 08:20:50
# @Last Modified by:   hersh
# @Last Modified time: 2019-12-23 22:50:42

bn_LUT=(1 3 6 10 16 25 35 50 65 80 99)
bn_LUTn=$(( ${#bn_LUT[@]} -1 ))

if [[ $(xbacklight | cut -d '.' -f2 | cut -b1) -lt 5 ]]; then
	# round down
	bn=$(xbacklight | cut -d '.' -f1)
else
	# round up
	bn=$(( $(xbacklight | cut -d '.' -f1) + 1 ))
fi
#echo $bn

i=0
while [[ $bn -ne ${bn_LUT[$i]} ]] && [[ $i -lt  $bn_LUTn ]]; do
	i=$(( i + 1 ))
done
#echo $i

if [[ $1 == "up" ]] && [[ $i -lt  $bn_LUTn ]]; then
#	echo up
	xbacklight =${bn_LUT[$(($i+1))]} -steps 1
elif [[ $1 == "down" ]] && [[ $i -gt 0 ]]; then
#	echo down
	xbacklight =${bn_LUT[$(($i-1))]} -steps 1
fi
