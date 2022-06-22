#!/bin/bash

dirkey="$1"
filterkey="$2"

if [ -z "$dirkey" ] || [ -z "$filterkey" ] ; then
        echo "-1"
        exit 1
fi

JSTATE=`which jstat`
PID=`ps -ef |grep tomcat|grep "${dirkey}"|grep -v grep |grep -v $0 |awk '{print $2}'|head -n 1`
RESULT=`/usr/bin/sudo  ${JSTATE}  -gcutil $PID |grep -v O`

case ${filterkey} in
        "O" )
                echo $RESULT | awk '{print $4}' ; exit 0 ;;
        "E" )
                echo $RESULT |awk '{print $3}' ; exit 0 ;;
        "P" )
                echo $RESULT |awk '{print $5}' ; exit 0 ;;
        "YGC" )
                echo $RESULT |awk '{print $6}' ; exit 0 ;;
        "YGCT" )
                echo $RESULT  |awk '{print $7}' ; exit 0 ;;
        "FGC" )
                echo $RESULT |awk '{print $8}' ; exit 0 ;;
        "FGCT" )
                echo $RESULT |awk '{print $9}' ; exit 0 ;;
        "GCT" )
                echo $RESULT |awk '{print $10}' ; exit 0 ;;
        "YPT")
                YGC=`echo $RESULT   |awk '{print $6}'`
                YGCT=`echo $RESULT   |awk '{print $7}'`
                echo $(echo "scale=2;  ${YGCT}/${YGC}"| bc -l)
                exit 0;;
        "FPT")
                FGC=`echo $RESULT   |awk '{print $8}'`
                FGCT=`echo $RESULT   |awk '{print $9}'`
                echo $(echo "scale=2;  ${FGCT}/${FGC}"| bc -l)  
                exit 0;;
        *  )
                echo "worng para"; exit 100 ;;
esac
