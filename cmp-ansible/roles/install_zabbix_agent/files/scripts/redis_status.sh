#!/bin/bash


item="$1"
redis_conf='/etc/redis/redis.conf'

if [ ! -f "$redis_conf" ] ; then
        redis_conf="/usr/local/redis/conf/redis.conf"
fi

if [ ! -f "$redis_conf" ] ; then
        redis_conf="/usr/local/redis/etc/redis.conf"
fi

bind_ip=` grep  bind  $redis_conf  |grep -v "#"|awk '{print $2}'`
bind_port=`grep  port  $redis_conf  |grep -v "#"|awk '{print $2}'`
redis_cli_info_command="redis-cli  -h  $bind_ip -p $bind_port  info "
requirepass=`grep  requirepass  $redis_conf  |grep -v "#"|awk '{print $2}'`

test -z "$bind_ip" && bind_ip=127.0.0.1
test -z "$bind_port"  && bind_port=6379

if [ -n "$requirepass" ] ;then
        redis_cli_info_command="redis-cli  -h  $bind_ip -p $bind_port  -a $requirepass info "
else
	redis_cli_info_command="redis-cli  -h  $bind_ip -p $bind_port  info " 
fi

if [ 'all' == "$item" ] ; then
        $redis_cli_info_command
        exit 0
fi

if [ -z "$item" ] || [ -z "$bind_ip" ] || [ -z "$bind_port" ] ; then
        echo "0"
        exit 100
fi

if [ "keys" == "$item" ] ; then
        redis_db="db1"
        if [ -n "$2" ] ; then
                redis_db="$2"
        fi
        $redis_cli_info_command | grep "$redis_db:"|head -n 1|awk -F'=|,' '{print $2}'
        exit 0
fi


$redis_cli_info_command | grep "$item" |awk -F':' '{print $NF}'
