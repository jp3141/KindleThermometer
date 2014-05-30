thermometer
===========

Kindle Thermometer &amp; Web server

This code runs on a jailbroken Kindle 4NT (Paperwhite). It uses the temperature sensor in the Kindle's CPU and displays temperature on the screen with a large font in Farenheit or Centigrade.

To run, just create the thermometer directory under /mnt/us and install all files. Then start thermometer.sh by logging into the Kindle via ssh.

A webserver on port :8014 also serves temperature via HTTP.

The temperature is updated every minute. A dot on the bottom of the screen shows progress every 5 s. The Kindle's buttons control the behaviour -- 
Home key    -> Clear the screen (refreshes the eink)
5-way Right -> Display in Centigrade
5-way Left  -> Display in Farenheit
5-way Up    -> Display a graph of recent temperatures
5-way Center-> Stop thermometer and become a normal Kindle. You can restart the app by logging in again.
The Kindle page-turning keys turn on- and off- the Wifi; currently the WiFi cannot be turned on again without rebooting the Kindle
The other buttons on the Kindle show other a few lines of Kindle internal information, like battery status, IP address etc.



