#!/bin/bash

if [ ! -f "$1" ]; then
	echo No such file: $1
	exit 1
fi

if [ -z "$2" ]; then
	echo Please add file name and label
	exit 2
fi

xorriso -indev $1 -outdev $1 -volid "$2" -commit

