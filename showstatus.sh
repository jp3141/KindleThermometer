#!/bin/sh

# HOME key
if [ $1 -eq 102 ]; then eips -c; fi

# RIGHT key
if [ $1 -eq 106 ]; then cp getC.awk getT.awk; fi

# LEFT key
if [ $1 -eq 105 ]; then cp getF.awk getT.awk; fi


# UP key
if [ $1 -eq 103 ]; then ./graph 9 -50 50; exit 0; fi

# top right button (broken button on K2)
if [ $1 -eq 109 ]; then /etc/init.d/wifid stop; fi

# top left button
if [ $1 -eq 193 ]; then /etc/init.d/wifid stop; fi

# bottom right button
if [ $1 -eq 191 ]; then /etc/init/wifid start; fi

# bottom left button
if [ $1 -eq 104 ]; then /etc/init/wifid start; fi

# center 5-way button -- reboot back to Kindle
if [ $1 -eq 194 ]; then
  eips -c; eips 3 5 "Rebooting to Kindle..."
  shutdown -rfn -t 0 now
fi


eips 0 1 "`date -R`"
eips 0 2 "`gasgauge-info -k | sed 's/Fahrenheit/F/`  "
eips 6 2 "`gasgauge-info -m`  "
eips 16 2 "`gasgauge-info -l`  "
eips 26 2 "`gasgauge-info -c | sed 's/%/ Percent/'`  "
eips 40 2 "`gasgauge-info -v`  "
echo key $1 $2
eips 0 4 "key: $1 $2  "
ifconfig|awk '/^[^l ]/,/END/{$1=$1;print substr(sprintf("eips 0 %i \"%s",6+a++, $0),1,60)"\""}'  | sh

# BACK key
if [ $1 -eq 158 ]; then
  awk -v T=`cat /sys/devices/system/yoshi_battery/yoshi_battery0/battery_temperature` -f getT.awk /dev/null | sh
fi
