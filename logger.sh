#!/bin/sh
PERIOD=60
while :; do
#sleep `date|awk -F '[: ]' '{print 3600-$5*60+$6}'`
printf "%s %s %s %s %s %s; %s F%.s; %4i %2s; %4i %3s; %4s; %4i %2s\n" `date -R;echo -k -l -m -c -v|xargs -n 1 gasgauge-info|tr '\n' ' '`
sleep `date|awk -v PERIOD=$PERIOD -F '[: ]+' '{print PERIOD-$6 % PERIOD}'`
done
