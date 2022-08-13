#!/bin/zsh
# BATDIR is the folder with your battery characteristics
BATDIR="/sys/class/power_supply/BAT1"
max=`cat $BATDIR/charge_full`
current=`cat $BATDIR/charge_now`
percent=$(( 100 * $current / $max ))

color_green="%{^[[32m%}"
color_yellow="%{^[[34m%}"
color_red="%{^[[31m%}"
color_reset="%{^[[00m%}"

if [ $percent -ge 80 ] ; then
    color=$color_green;
elif [ $percent -ge 40 ] ; then
    color=$color_yellow;
else
    color=$color_red;
fi
echo $color$percent$color_reset
