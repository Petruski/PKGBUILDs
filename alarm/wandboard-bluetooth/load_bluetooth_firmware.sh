#!/bin/bash


MAC_OPTIONS=""
if [ -z "$MAC_ADDR" ]; then
	echo "MAC_ADDR in /etc/conf.d/bcm4329 not set, will use MAC set by device (expect this to be buggy)"
else
	MAC_OPTIONS="--bd_addr $MAC_ADDR"
fi

/usr/lib/firmware/brcm/brcm_patchram_plus --scopcm=1,4,0,0,0,0,0,0,0,0 --patchram /usr/lib/firmware/brcm/bcm4329.hcd --baudrate 3000000 --use_baudrate_for_download $MAC_OPTIONS /dev/ttymxc2
sleep 3
hciattach -n /dev/ttymxc2 any 3000000
