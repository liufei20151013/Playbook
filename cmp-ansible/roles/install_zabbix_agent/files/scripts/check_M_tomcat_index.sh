#!/bin/bash
# check tomcat for m website 

/usr/bin/curl -o /dev/null -s -w %{http_code} "http://127.0.0.1:9080/index"

