#!/bin/bash
battery_capacity=$(cat /sys/class/power_supply/BAT0/capacity)
#battery_capacity=`echo $(($battery_capacity + 2))` 
# battery_status=$(cat /sys/class/power_supply/BAT0/status)
# First echo updates the full_text i3bar key
echo "$battery_capacity%"
# Second echo updates the short_text i3bar key
echo "$battery_capacity%"
# Third echo updates the color i3bar key
if [ $battery_capacity -le 30 ] && [ $battery_capacity -gt 20 ]
then
    echo "#b57614"
elif [ $battery_capacity -le 20 ]
then
    echo "#af3a03"
elif [ $battery_capacity -le 100 ] && [ $battery_capacity -gt 70 ]
then
	echo "#2be502"
fi
