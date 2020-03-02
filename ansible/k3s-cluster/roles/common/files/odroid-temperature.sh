#!/bin/bash
bool=true
counter=0
while [ $bool = true ]
do
    echo "Displaying CPU/GPU temperatures...(Press 'ctrl+c' to exit)"; echo
    echo "Running time:" $counter "seconds"; echo
    echo "CPU 0/1:"; awk '{printf "%3.1f°C\n", $1/1000}' /sys/class/thermal/thermal_zone0/temp; echo
    echo "CPU 2/3:"; awk '{printf "%3.1f°C\n", $1/1000}' /sys/class/thermal/thermal_zone1/temp; echo
    echo "CPU 4/5:"; awk '{printf "%3.1f°C\n", $1/1000}' /sys/class/thermal/thermal_zone2/temp; echo
    echo "CPU 6/7:"; awk '{printf "%3.1f°C\n", $1/1000}' /sys/class/thermal/thermal_zone3/temp; echo
    echo "GPU:"; awk '{printf "%3.1f°C\n", $1/1000}' /sys/class/thermal/thermal_zone4/temp; echo
    sleep 1s; ((counter++)); echo
    clear
done
