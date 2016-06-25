#!/bin/sh
#Sets up the pins for the watering script to use.

#add to root cron tab.
#minute (0-59), hour (0-23, 0 = midnight), day (1-31), month (1-12), weekday (0-6, 0 = Sunday), command 
#@reboot /path/to/script
#runs every time the raspi reboots
#https://help.ubuntu.com/community/CronHowto

#sets pin 17 for output and turns off the relay
echo "17" > /sys/class/gpio/export
echo "out" > /sys/class/gpio/gpio17/direction

#my relay board is reversed so it requires a high signal to turn off, 
#for hardware simplicity I kept it this way.
echo "1" > /sys/class/gpio/gpio17/value
