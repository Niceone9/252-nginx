#!/bin/bash
#日志格式 log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
#如192.168.1.6 - - [29/Oct/2020:16:23:52 +0800] "GET /favicon.ico HTTP/1.1" 200 5558 "http://www.discuz.com/" "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36"

LOGFILE=acc_dis.log
echo "----------统计UV,访问最多次数的IP--------"
awk '{a[$1]++}END{print "UV:",length(a);for (v in a)print a[v],v }' $LOFFILE|sort -nr|head -n10
echo "------------------------"

echo "统计时间段访问最多的IP"
awk '$4>="[30/Oct/2020:16:32:08" && $4<="[30/Oct/2020:17:38:08" {a[$1]++}END{print "UV:",length(a);for (v in a)print a[v],v}' $LOFFILE|sort -nr|head -n10
echo "-------------------------"

echo "统计访问最多的10个页面"
awk '{a[$7]++}END{print "PV:",length(a);for(v in a){if(a[v]>30)print a[v],v} }' $LOFFILE |sort -nr
echo "----------------------------"

echo "统计页面状态码数量"
awk '{a[$7" "$9]++}END{for (v in a) {if(a[v]>5) print a[v],v}}' $LOFFILE |sort  -k3 -nr
echo "-----------------------------------------"

