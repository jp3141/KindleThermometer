#!/bin/sh
# args = min max scale_in_pixels=100
./bitblt graphBackground.rXY 0 0
tail -n 800 /var/tmp/thermometer.log|awk -v min=$1 -v max=$2 '{printf("echo -ne \"\xFF\xFF\xFF\xFF\xFF\"|dd bs=1 seek=%i of=/dev/fb0 2> /dev/null\n",(FNR-1)*600+100*($7-min)/(max-min))}'|sh
eips ''
eips "$1     $2"
