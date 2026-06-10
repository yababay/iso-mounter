#!/bin/bash

if [ -z "$1" ]; then
	echo Please provide Volume ID
	exit 1
fi

UUID="`uuidgen`"

echo Please write down: $UUID

mkisofs -o ../$UUID.iso -J -R -V "$1" .
