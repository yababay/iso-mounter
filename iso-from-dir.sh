#!/bin/bash

if [ -z "$1" ]; then
	echo Please provide Volume ID
	exit 1
fi

UUID="`uuidgen`"

mkisofs -o ../../$UUID.iso -J -R -V "$1" .

echo
echo Now you can burn this image with command: ../burn.sh ../../$UUID.iso
echo

