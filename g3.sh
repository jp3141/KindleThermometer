#!/bin/sh
for R in `seq 0 1 799`; do
cat l2 >> l3
done

tail -n 800 /var/tmp/thermometer.log|awk -v min=$1 -v max=$2 '{printf("echo -ne \"\xFF\xFF\xFF\xFF\xFF\"|dd bs=1 seek=%i of=/dev/fb0 2> /dev/null\n",(FNR-1)*600+100*($7-min)/(max-min))}'|sh

