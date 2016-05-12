#!/bin/sh
#A script to turn on and off the relay connected to over gpio
#based on a schedule.

#add to cron tab.
#minute (0-59), hour (0-23, 0 = midnight), day (1-31), month (1-12), weekday (0-6, 0 = Sunday), command 
#01 09 * * 1, /path/to/script
#runs once a week, on monday at 9am.
#https://help.ubuntu.com/community/CronHowto

#pin 11 on rpi gpio0
echo "17" > /sys/class/gpio/export
echo "out" > /sys/class/gpio/gpio17/direction

#display current value
cat > /sys/class/gpio/gpio17/value

#
echo  "1" > sys/class/gpio/gpio17/value

#switch to 0 for 5 sec
for(( i=5 i>0; i-- )); do
	sleep 1 &
	wait
done

echo  "0" > sys/class/gpio/gpio17/value



#switch to 1
for(( i=5 i>0; i-- )); do
	sleep 1 &
	wait
done

echo  "1" > sys/class/gpio/gpio17/value
