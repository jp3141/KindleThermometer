 printf "\"%d %c; %4d %3s;   %3d %2s;    %3d Percent; %4d %2s\"" `echo -ne -k -m -l -c -v | xargs -n 1 gasgauge-info | tr '\n' ' '`
