i=1
while IFS= read -r line; do
    echo "Text read from file: $line"
    echo "https://classtranscribe.ncsa.illinois.edu$line"
    curl -s --limit-rate 660k --output /dev/null "https://classtranscribe.ncsa.illinois.edu$line" &
    echo "Sleeping"
    sleep 3
    echo "Slept $i"
    i=$((i + 1))
    #break
done < files.txt