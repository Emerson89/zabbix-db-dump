#!/bin/bash

pg_dump -U zabbix -d zabbix --exclude-table-data '*.history*' --exclude-table-data '*.trends*'| gzip > /tmp/zabbix-`date +%Y-%m-%d-%H-%M`.sql.gz

##pg_dump -h 127.0.0.1 -U zabbix -W -d zabbix --exclude-table-data '*.history*' --exclude-table-data '*.trends*'| gzip > /tmp/zabbix-`date +%Y-%m-%d-%H-%M`.sql.gz
