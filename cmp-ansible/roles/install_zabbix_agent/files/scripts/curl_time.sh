#!/bin/bash

type=$1
url=$2

curl --connect-timeout 5 -m 5 -o /dev/null -s -w %{$type} "$url" 
