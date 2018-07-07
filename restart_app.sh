#!/bin/bash
#restart app if down
: '
touch /root/Python/remediation_status
chmod 777 /root/Python/remediation_status
'
#!/bin/bash
if [ -f /root/Python/remediation_status ]; then
    rm -rf /root/Python/remediation_status
fi

#Service with app down
#appdown=`cat /root/Python/appstatus | grep down | awk '{print $1}'`
appdown=$(cat /root/Python/appstatus | grep down | awk '{print $1}')
#: <<'end_long_comment'
for server in $appdown; do
    ssh -q  root@$server "systemctl start httpd.service"
    if curl -k -s --head --request GET http://$server/#/login | grep '200'| awk '{print $2}' > /dev/null ; then
      	echo "$server application restarted" >> /root/Python/remediation_status
    else
       echo "$server application still have problem" >> /root/Python/remediation_status
    fi
done
chmod 777 /root/Python/remediation_status
cat /root/Python/remediation_status
#end_long_comment
