#!/bin/bash
i=1
ip=`curl ifconfig.me`
trial=0
echo "My IP:$ip"
while IFS= read -r line; do
    url="https://classtranscribe.ncsa.illinois.edu$line"
    echo $url
    logfile=`echo $line|cut -d'-' -f 2`
    logfile="../logs/$i.txt"
    echo $logfile
    ./script2.sh  $url $ip $i $trial $logfile &
    echo "Sleeping"
    sleep 3
    echo "Slept $i"
    i=$((i + 1))
    # if [ $i -eq 2 ]
    # then
    #     break
    # fi
done < files.txt