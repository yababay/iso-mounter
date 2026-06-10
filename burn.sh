#!/bin/bash

if [ ! -f "$1" ]; then
	echo No file is pointed
	exit 1
fi

growisofs -dvd-compat -Z /dev/sr0=$1
