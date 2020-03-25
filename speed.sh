#!/bin/bash

#         1         2           3       4           5           6          7            8               9           10   
#"server name","server id","latency","jitter","packet loss","download","upload","download bytes","upload bytes","share url"
# ^ from `speedtest -f csv --show-headers`
CSV=$(speedtest --accept-license --accept-gdpr -f csv)

# Test data
#CSV='"Elisa Oyj - Helsinki","22669","11.984","2.999","0","6507451","813882","64329096","10560080","https://www.speedtest.net/result/c/3cccf7c3-fff1-4641-b5c5-58035514ba5b"'
get_x_from_csv () {
    echo $(echo $CSV | awk -F "\"*,\"*" '{print $'$1'}')
}

SERVER=$(get_x_from_csv "1")
SERVER_ID=$(get_x_from_csv "2")
LATENCY=$(get_x_from_csv "3")
JITTER=$(get_x_from_csv "4")
DOWNLOAD=$(get_x_from_csv "6")
DOWNLOAD_BYTES=$(get_x_from_csv "8")
UPLOAD=$(get_x_from_csv "7")
UPLOAD_BYTES=$(get_x_from_csv "9")
TEST_URL=$(get_x_from_csv "10")

POST_DATA="download,host=${HOST},server_id=${SERVER_ID} speed=${DOWNLOAD},bytes=${DOWNLOAD_BYTES}
upload,host=${HOST},server_id=${SERVER_ID} speed=${UPLOAD},bytes=${UPLOAD_BYTES}
ping,host=${HOST},server_id=${SERVER_ID} latency=${LATENCY},jitter=${JITTER}"
curl -sL -XPOST "$INFLUXDB/write?db=$DB" --data-binary "$POST_DATA"
