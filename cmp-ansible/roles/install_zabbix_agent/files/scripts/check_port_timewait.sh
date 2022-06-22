#!/bin/bash

port=$1


netstat  -an |grep ":$port " |grep -i 'TIME_WAIT'|wc -l

