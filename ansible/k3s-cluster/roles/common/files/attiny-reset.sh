#!/bin/bash
DEVICE=16d0:087e
echo "Searching for $DEVICE"
devPath=`lsusb | grep $DEVICE | sed -r 's/Bus ([0-9]{3}) Device ([0-9]{3}).*/bus\/usb\/\1\/\2/g;'`
echo "Found $DEVICE @ $devPath"
echo "Searching for sysPath"
for sysPath in /sys/bus/usb/devices/*; do
    echo "$sysPath/uevent"
    devName=`cat "$sysPath/uevent" | grep $devPath`
    #echo devName=$devName
    if [ ! -z $devName ] 
    then
        break
    fi
done
if [ ! -z  $devName ] 
then
    echo "Found $DEVICE @ $sysPath, Resetting"
    echo "echo 0 > $sysPath/authorized"
    echo 0 > $sysPath/authorized
    echo "echo 1 > $sysPath/authorized"
    echo 1 > $sysPath/authorized
else
    echo "Could not find $DEVICE"
fi
