#!/bin/bash

port=$1


netstat  -an |grep ":$port " |grep -i est|wc -l

