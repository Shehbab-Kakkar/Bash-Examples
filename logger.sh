#!/bin/bash -e
df -h > /tmp/dfh
STATUS=`echo $?`
if [ $STATUS -eq 1 ]; then
       logger "Successfully Executed" -t LoggerScript -f /var/log/messages
else   
       logger "Failed to Executed" -t LoggerScript -f /var/log/messages
fi

