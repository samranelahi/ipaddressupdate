#!/bin/bash
# This script gets ip address and check it with the file. If it doesn't match
# then it overwrites the file.

if [ -s ~/public_ip.txt ] ;
then echo "file exist with contents";
else echo "0.0.0.0" > ~/public_ip.txt;
fi

LOG=~/public_ip.log
a=`curl http://checkip.dyndns.org` > /dev/null
b=`echo $a | sed 's/<html><head><title>Current IP Check<\/title><\/head><body>Current IP Address: //'`
c=`echo $b | sed 's/<\/body><\/html>//'`
#echo $c > ~/public_ip.txt
x=`cat ~/public_ip.txt`
echo $x
if [ $c != $x ]
then
echo $c > ~/public_ip.txt
echo `date` ": ip address updated to $c" >> $LOG
else
echo `date` ": Ip address is same. No update required" >> $LOG
fi
