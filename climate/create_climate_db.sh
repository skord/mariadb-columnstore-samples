#!/bin/sh
MCS_DIR=/usr/local/mariadb/columnstore
SCHEMA_DIR=$(readlink -f ./schema)

# create climate database (dropping if exists) with 3 columnstore tables: observations, stations, and inventories
$MCS_DIR/mysql/bin/mysql --defaults-file=$MCS_DIR/mysql/my.cnf -u root -vvv < $SCHEMA_DIR/schema.sql
