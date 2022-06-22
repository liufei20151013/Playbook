#!/bin/bash

dirkey="$1"
filterkey="$2"

if [ -z "$dirkey" ] || [ -z "filterkey" ] ; then
        echo "-1"
        exit 1
fi

JSTATE=`which jstat`
PID=`ps -ef |grep tomcat|grep "${dirkey}"|awk '{print $2}'`
/usr/bin/sudo  ${JSTATE}  -gcutil $PID | grep -v ${filterkey} | awk '{print $4}'
