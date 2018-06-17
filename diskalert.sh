#!/bin/bash -e
THRESHOULD=30
mailto="root"
HOSTNAME=$(hostname)
#echo $(HOSTNAME)
for path in `/bin/df -h| grep -vE 'Filesystem|tmpfs' | awk '{print $5}' | sed 's/%//g'`
do
   if [ ${path} -ge $THRESHOULD ]; then
       df -h | grep ${path}% >> /tmp/temp
   fi
done

VALUE=`cat /tmp/temp | wc -l`
       if [ $VALUE -ge 1 ]; then
       mail -s "${HOSTNAME} Disk Usuage is critical" $mailto < /tmp/temp
       fi
rm -rf /tmp/temp
