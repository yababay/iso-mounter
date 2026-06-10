#!/bin/bash

UUID="`uuidgen`"

echo
echo Wright down this: $UUID
echo

sudo dd if=/dev/sr0 of=/media/video/iso/$UUID.iso bs=2048 status=progress

eject
