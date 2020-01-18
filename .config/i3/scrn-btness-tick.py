#!/usr/bin/env python

import sys
import subprocess as sp

disable_fade = True

bn_LUT = [
	1, 3, 6, 10, 16, 25, 35, 50, 65, 80, 100
]

def btness_set_new(bn_new):
	cmd = ['xbacklight', '-set', str(bn_new)]
	if disable_fade:
		cmd += ['-steps','1']
	sp.call(cmd)

def scrn_btness_tick():
	direction = sys.argv[1]
	bn_old_str = sp.check_output(['xbacklight', '-get'])
	bn_old = int(round(float(bn_old_str)))

	if direction=='up' and bn_old < bn_LUT[-1]:
		# bn_new = bn_old*1.2
		# new brightness is first LU value above old brightness
		btness_set_new(min(
			bn_LUT,
			key=lambda x: x if (x-bn_old)>0 else 999
		))

	elif direction=='down' and bn_old > bn_LUT[0]:
		# bn_new = bn_old/1.2
		# new brightness is first LU value below old brightness
		btness_set_new(max(
			bn_LUT,
			key=lambda x: x if (bn_old-x)>0 else 0
		))

if __name__=="__main__":
	scrn_btness_tick();