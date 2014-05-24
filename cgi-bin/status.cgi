#!/bin/sh
echo -ne "
<!DOCTYPE html>
<html>
  <body>
  <p style='font-family:Arial;font-size:48px;font-weight:bold;margin-top:10px'><font color=blue><u>Kindle Thermometer</u></font></p>
<p style='font-family:Arial;font-size:196px;font-weight:bold;line-height:10px;margin-top:100px;margin-bottom:100px'>" > /tmp/CGI.tmp
printf "%s &#176F</p>%.s\n" `gasgauge-info -k` >> /tmp/CGI.tmp

printf "%s &#176F%.s; %i %s; %i %s; %i %%; %i %s<br>\n" `echo -k -l -m -c -v | xargs -n 1 gasgauge-info | tr '\n' ' '` >> /tmp/CGI.tmp
#       T degF        iii mA   iiii mAh; %%%%; iiii mV 
echo $REMOTE_ADDR":"$REMOTE_PORT"<br>
"$QUERY_STRING"<br>
</body>
</html>"  >> /tmp/CGI.tmp
echo -ne "HTTP/1.0 200 OK\r\nContent-Length: $(wc -c < /tmp/CGI.tmp)\r\n\r\n"; cat /tmp/CGI.tmp 

#cat /tmp/CGI.tmp
