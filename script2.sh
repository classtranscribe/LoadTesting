#!/bin/bash

url=$1
ip=$2
i=$3
trial=$4
logfile=$5
curl -X POST "https://classtranscribe.ncsa.illinois.edu/api/Logs" \
    -H "accept: */*" -H "Content-Type: application/json-patch+json" \
    -d "{\"userId\":\"$ip:$i\",\"eventType\":\"start_dl\", \"offeringId\": \"load_test_$trial\", \"mediaId\": \"load_testing\" }"
curl --limit-rate 660k --output /dev/null $url -w "%{time_total},%{size_download},%{speed_download}\n"  2>&1 \
|tr '\r' '\n' > $logfile &
curl -X POST "https://classtranscribe.ncsa.illinois.edu/api/Logs" \
    -H "accept: */*" -H "Content-Type: application/json-patch+json" \
    -d "{\"userId\":\"$ip:$i\",\"eventType\":\"stop_dl\", \"offeringId\": \"load_test_$trial\", \"mediaId\": \"load_testing\" }"