
while :;do (waitforkey;./showstatus.sh);done &
eips -c
date; gasgauge-info -k | awk -v CMD='./show2.sh' -f getT.awk; eips ''
sleep `date|awk -F '[: ]+' '{print 60-$6}'`
while true; do
  date
  gasgauge-info -k | awk -v CMD='./show2.sh' -f getT.awk
  for R in `seq 0 72 799`; do
    for B in `seq 0 4`; do
      echo -ne '\x00\x00\x00\x00\x00\xFF\xFF\xFF\xFF\xFF'| dd bs=600 seek=`expr $R + $B` of=/dev/fb0 2> /dev/null
    done
    eips ''
    sleep `date|awk -F '[: ]+' '{print 5-($6 % 5)}'`
  done
done
