#!/bin/sh
# check for argument, if so use as wildcard for file load match, otherwise load everything
MCS_DIR=/usr/local/mariadb/columnstore

curl http://noaa-ghcn-pds.s3.amazonaws.com/ghcnd-stations.txt |cut -c 1-11,13-20,22-30,32-37,39-40,42-71,73-75,77-79,81-85 --output-delimiter='|'|sed 's/ *| */|/g'  |$MCS_DIR/bin/cpimport -s "|"  climate stations 

curl http://noaa-ghcn-pds.s3.amazonaws.com/ghcnd-inventory.txt |cut -c 1-11,13-20,22-30,32-35,37-40,42-45 --output-delimiter='|'|sed 's/ *| */|/g' | $MCS_DIR/bin/cpimport -s "|" climate inventories

for ((i=1763;i<=2017;i++)); do
  curl http://noaa-ghcn-pds.s3.amazonaws.com/csv.gz/$i.csv.gz |zcat - | awk -F\, 'BEGIN {OFS = FS} {$2 = substr($2,1,4) "-" substr($2,5,2) "-" substr($2,7,2)} 1' |$MCS_DIR/bin/cpimport -s "," climate observations
done
