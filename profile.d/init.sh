#! /bin/sh
if [ ! -f ~/.disable ]; then
	export WINIP=$(cat /etc/resolv.conf | grep 'nameserver' | cut -f 2 -d ' ')
	export WSLIP=$(ip addr show eth0 | grep 'inet ' | cut -f 6 -d ' ' | cut -f 1 -d '/')

	if [ -d /etc/profile.d/.init.d ]; then
		for i in /etc/profile.d/.init.d/*.sh; do
		if [ -r $i ]; then
		. $i
		fi
		done
		unset i
	fi
fi
