#!/bin/bash
# This script gets ip address and check it with the file. If it doesn't match
# then it overwrite the file. 
LOG="/home/samranelahi/cron.log"
a=`curl http://checkip.dyndns.org`
b=`echo $a | sed 's/<html><head><title>Current IP Check<\/title><\/head><body>Current IP Address: //'`
c=`echo $b | sed 's/<\/body><\/html>//'`
x=`cat /home/samranelahi/public_ip.txt`
if [ $c != $x ]
then
echo $c > /home/samranelahi/public_ip.txt
echo $c > /home/samranelahi/Public/public_ip.txt
echo `date` ": ip address updated to $c" >> $LOG
else
echo `date` ": Ip address is same. No update required" >> $LOG
fi
