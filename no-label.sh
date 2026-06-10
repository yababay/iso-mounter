#!/bin/bash

ls -1 *.iso | while read ISO; 
do 
	VOLUME_ID="`isoinfo -d -i $ISO | grep 'Volume id' | sed 's/Volume\ id\:\ //'`"
	if [ "$VOLUME_ID" != "CDROM" ]; then
		continue
	fi
	echo
	echo ================================================
	echo "$ISO ($VOLUME_ID)"
	xorriso -indev $ISO -ls / 2>/dev/null
done
