#!/bin/sh
#Create 2016.02.20
MYSQL_SOCK="/tmp/mysql3306.sock"
MYSQL_USER="rpl_monitor"
MYSQL_PWD='FDELxmGvez'
#ARGS=1
#if [ $# -ne "$ARGS" ];then
#    echo "Please input one arguement:"
#fi
case $1 in
    Uptime)
        result=`mysqladmin -u${MYSQL_USER} -p${MYSQL_PWD} -S $MYSQL_SOCK status|cut -f2 -d":"|cut -f1 -d"T"`
            echo $result
            ;;
        Com_update)
            result=`mysqladmin -u${MYSQL_USER} -p${MYSQL_PWD} -S $MYSQL_SOCK extended-status |grep -w "Com_update"|cut -d"|" -f3`
            echo $result
            ;;
        Slow_queries)
        result=`mysqladmin -u${MYSQL_USER} -p${MYSQL_PWD} -S $MYSQL_SOCK status |cut -f5 -d":"|cut -f1 -d"O"`
                echo $result
                ;;
    Com_select)
        result=`mysqladmin -u${MYSQL_USER} -p${MYSQL_PWD} -S $MYSQL_SOCK extended-status |grep -w "Com_select"|cut -d"|" -f3`
                echo $result
                ;;
    Com_rollback)
        result=`mysqladmin -u${MYSQL_USER} -p${MYSQL_PWD} -S $MYSQL_SOCK extended-status |grep -w "Com_rollback"|cut -d"|" -f3`
                echo $result
                ;;
    Questions)
        result=`mysqladmin -u${MYSQL_USER} -p${MYSQL_PWD} -S $MYSQL_SOCK status|cut -f4 -d":"|cut -f1 -d"S"`
                echo $result
                ;;
    Com_insert)
        result=`mysqladmin -u${MYSQL_USER} -p${MYSQL_PWD} -S $MYSQL_SOCK extended-status |grep -w "Com_insert"|cut -d"|" -f3`
                echo $result
                ;;
    Com_delete)
        result=`mysqladmin -u${MYSQL_USER} -p${MYSQL_PWD} -S $MYSQL_SOCK extended-status |grep -w "Com_delete"|cut -d"|" -f3`
                echo $result
                ;;
    Com_commit)
        result=`mysqladmin -u${MYSQL_USER} -p${MYSQL_PWD} -S $MYSQL_SOCK extended-status |grep -w "Com_commit"|cut -d"|" -f3`
                echo $result
                ;;
    Bytes_sent)
        result=`mysqladmin -u${MYSQL_USER} -p${MYSQL_PWD} -S $MYSQL_SOCK extended-status |grep -w "Bytes_sent" |cut -d"|" -f3`
                echo $result
                ;;
    Bytes_received)
        result=`mysqladmin -u${MYSQL_USER} -p${MYSQL_PWD} -S $MYSQL_SOCK extended-status |grep -w "Bytes_received" |cut -d"|" -f3`
                echo $result
                ;;
    Com_begin)
        result=`mysqladmin -u${MYSQL_USER} -p${MYSQL_PWD} -S $MYSQL_SOCK extended-status |grep -w "Com_begin"|cut -d"|" -f3`
                echo $result
                ;;
    mysql_ping)
        result=`mysqladmin -u${MYSQL_USER} -p${MYSQL_PWD} -S $MYSQL_SOCK ping|grep -c alive`
                echo $result
                ;;
    mysql_version)
        result=`mysqladmin -u${MYSQL_USER} -p${MYSQL_PWD} -S $MYSQL_SOCK extended-status |grep -w "Bytes_received" |cut -d"|" -f3`
                echo $result
                ;;
    slave_status)
        result=`/usr/local/mysql/bin/mysql  -u${MYSQL_USER} -p${MYSQL_PWD} -S $MYSQL_SOCK -e 'show slave status\G' |grep -E "Slave_IO_Running|Slave_SQL_Running"|awk '{print $2}'|grep -c Yes`
                echo $result
                ;;
    slave_3307)
        result=`/usr/local/mysql/bin/mysql  -u${MYSQL_USER} -p${MYSQL_PWD} -S /tmp/mysql3307.sock -e 'show slave status\G' |grep -E "Slave_IO_Running|Slave_SQL_Running"|awk '{print $2}'|grep -c Yes`
                echo $result
                ;;

        *)
        echo "Usage:$0(Uptime|Com_update|Slow_queries|Com_select|Com_rollback|Questions)"
        ;;
esac
