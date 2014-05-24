#!/bin/sh

iptables -P INPUT ACCEPT
httpd -h .
httpd -p 8014 -h .

/etc/init.d/cron stop
/etc/init.d/phd stop
/etc/init.d/cmd stop
/etc/init.d/powerd stop
#lipc-set-prop com.lab126.pmond stop powerd
#kill -9 `pidof powerd`
#lipc-set-prop com.lab126.powerd wakeUp 1
/etc/init.d/tmd stop
/etc/init.d/webreaderd stop
killall -9 logger
kill -9 `pidof lifeguard`
/etc/init.d/browserd stop
/etc/init.d/pmond stop
#/etc/init.d/wifi stop
/etc/init.d/framework stop

while :;do (waitforkey|xargs -n 2 ./showstatus.sh);done &
eips -c
#date; gasgauge-info -k | awk -v CMD='./show2.sh' -f getT.awk
date 
awk -v T=`cat /sys/devices/system/yoshi_battery/yoshi_battery0/battery_temperature` -f getT.awk /dev/null | sh
#gasgauge-info -k | awk -f getT.awk | sh
eips ''

sleep `date|awk -F '[: ]+' '{print 60-$6}'`

while true; do
  date
#  gasgauge-info -k | awk -f getT.awk | sh
awk -v T=`cat /sys/devices/system/yoshi_battery/yoshi_battery0/battery_temperature` -f getT.awk /dev/null | sh
  for R in `seq 2 72 799`; do
    ./bitblt 5x5.rXY 5 $R
    eips ''
    sleep `date|awk -F '[: ]+' '{print 5-($6 % 5)}'`
  done
done
