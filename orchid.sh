#!/bin/bash
#A script to turn on and off the relay connected to over gpio
#based on a schedule.

#add to cron tab.
#minute (0-59), hour (0-23, 0 = midnight), day (1-31), month (1-12), weekday (0-6, 0 = Sunday), command 
#01 09 * * 1 /path/to/script
#runs once a week, on monday at 9am.
#https://help.ubuntu.com/community/CronHowto

#display current value for testing
#cat /sys/class/gpio/gpio17/value

#6 cycles of 60 seconds each is good for my orchids
current=0
cycles=5

while [ $current -le $cycles ] 
do
	#the controls are inverted on the relay boards I have
	#I wanted to keep the system as simple as possible for now,
	#so I kept this.
	#this turns the relay on.
	echo  "0" > /sys/class/gpio/gpio17/value
	sleep 60 &
	wait

	#this turns the relay off for 20 minutes.
	echo  "1" > /sys/class/gpio/gpio17/value
	sleep 1200 &
	wait

	(( current+=1 ))
done

exit 0






