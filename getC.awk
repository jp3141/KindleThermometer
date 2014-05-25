END { # displays -dd or 1dd
T = int((T-32)*5/9 + 0.5)
if (T < 0) {
  T = -T
  firstPos = "minus"
  } else {
  firstPos = (T >= 100) ? 1 : "blank"
  }
tens = int(T/10) % 10
if (T < 10) tens = "blank"
units = T % 10
printf("dd if=/dev/zero bs=1 count=480 2> /dev/null | cat - %s.raw %s.raw %s.raw deg_C.raw > /dev/fb0\n", firstPos, tens, units)
printf("./bitblt CurrentKindleTemperature.rXY 550 0");
}
