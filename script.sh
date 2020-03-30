i=1
while IFS= read -r line; do
    echo "Text read from file: $line"
    echo "https://classtranscribe.ncsa.illinois.edu$line"
    logfile=`echo $line|cut -d'-' -f 2`
    logfile="../logs/$logfile.txt"
    echo $logfile
    curl --limit-rate 660k --output /dev/null "https://classtranscribe.ncsa.illinois.edu$line" -w "%{time_total},%{size_download},%{speed_download}\n" &> $logfile &
    echo "Sleeping"
    sleep 3
    echo "Slept $i"
    i=$((i + 1))
    # if [ $i -eq 3 ]
    # then
    #     break
    # fi
done < files.txt