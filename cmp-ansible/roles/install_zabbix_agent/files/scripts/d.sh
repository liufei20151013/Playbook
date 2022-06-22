#!/bin/bash
cd `dirname $0`
source /etc/profile
source ~/.bash_profile

comm=$1

if [ "$comm" == "d.sh" ] ; then
	exit 100
fi

./${comm} "$2" "$3" "$4" "$5" "$6"
