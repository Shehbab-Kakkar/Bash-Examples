#!/bin/bash
if [ -f /root/Python/appstatus ]; then
    rm /root/Python/appstatus
fi

NODENAME='192.168.43.190'
HTTPSTATUSCODE='200'
CONNECT=`curl -k -s --head --request GET https://$NODENAME/#/login | grep '200'| awk '{print $2}'`
#CONNECT=`curl -k -s --head --request GET http://$NODENAME/#/login | grep '200'| awk '{print $2}'`
    if [ "$CONNECT" == "$HTTPSTATUSCODE" ]; then
    echo "$NODENAME application up" >> /root/Python/appstatus
    else
    echo "$NODENAME application down"  >> /root/Python/appstatus
    fi
chmod 777 /root/Python/appstatus
cat /root/Python/appstatus


