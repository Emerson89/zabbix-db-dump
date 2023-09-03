#!/bin/bash

DBUSER="zabbix"
DBPASS="zabbix"
DBHOST="127.0.0.1"
DBNAME="zabbix"

pg_dump --dbname=postgresql://$DBUSER:$DBPASS==@$DBHOST:5432/$DBNAME -v -F custom \
--exclude-schema=_timescaledb_internal \
--exclude-schema=_timescaledb_cache \
--exclude-schema=_timescaledb_catalog \
--exclude-schema=_timescaledb_config \
--exclude-schema=_timescaledb_internal \
--exclude-table-data '*.history*' \
--exclude-table-data '*.trends*' \
| gzip > /tmp/zabbix-`date +%Y-%m-%d-%H-%M`.sql.gz