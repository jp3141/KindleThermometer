
#/usr/sbin/eips -c
dd if=/dev/zero bs=1 count=480 2> /dev/null | cat - $1.raw $2.raw $3.raw deg_F.raw > /dev/fb0 
#/usr/sbin/eips ''
