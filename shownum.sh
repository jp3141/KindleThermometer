eips -c

dd if=/dev/zero bs=1 of=offset.raw count=500
cat offset.raw blank.raw | dd bs=600 seek=0  of=/dev/fb0
cat offset.raw minus.raw | dd bs=600 seek=39 of=/dev/fb0
cat offset.raw $1.raw    | dd bs=600 seek=127 of=/dev/fb0
cat offset.raw $2.raw    | dd bs=600 seek=268 of=/dev/fb0
cat offset.raw $3.raw    | dd bs=600 seek=409 of=/dev/fb0
cat offset.raw deg_F.raw | dd bs=600 seek=550 of=/dev/fb0
eips ''
