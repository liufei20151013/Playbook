#!/bin/bash

logtxt='/tmp/getBeforeSamllLucker.txt'



curl --connect-timeout=10 -d number=10 -H "tokenMACP:237bb2e0375bb4e1c6b8095c74368da32167e20d70eb442fe0aea691a18d30c04361308f838b1627cdbf72ed1f2e9244"  'http://127.0.0.1:8080/MACP/luckyWheel/getBeforeSamllLucker.do'  >  ${logtxt}  2>/dev/null

v=`grep resultS ${logtxt}`

## 成功返回
if [ -n "$v"  ] ; then
        echo 1
        exit 0
fi

echo  0;

