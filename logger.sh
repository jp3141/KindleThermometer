#!/bin/sh
cd /var/tmp
PERIOD=3600
while :; do
#sleep `date|awk -F '[: ]' '{print 3600-$5*60+$6}'`
printf "%s %s %s %s %s %s; %s F%.s; %4i %2s; %4i %3s; %4s; %4i %2s\n" `date -R;echo -k -l -m -c -v|xargs -n 1 gasgauge-info|tr '\n' ' '`>> thermometer.log
sleep `date|awk -v PERIOD=$PERIOD -F '[: ]+' '{print (PERIOD-($5*60+$6+1)) % PERIOD}'`
wc -l thermometer.log | awk '$1>4800{system("sed -i 1,"$1-2400 "\\d thermometer.log")}'
sleep 1
done
