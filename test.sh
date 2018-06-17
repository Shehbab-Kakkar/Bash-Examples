#!/bin/bash -e
#disklist=`uname -a | awk '{ print $2 }'`
#disklist=`hostname -s`
disklist=$(uname -a | awk '{ print $2 }')
echo ${disklist}

