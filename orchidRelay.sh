#!/bin/sh
#A script to turn on and off the relay connected to over gpio
#based on a schedule.

#pin 11 on rpi gpio0
echo "17" > /sys/class/gpio/export
echo "out" > /sys/class/gpio/gpio17/direction

#display current value
cat > /sys/class/gpio/gpio17/value

#switch to 0
echo  "0" > sys/class/gpio/gpio17/value

#switch to 1
echo  "1" > sys/class/gpio/gpio17/value