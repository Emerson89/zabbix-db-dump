#!/bin/bash

pg_dump -U zabbix zabbix | gzip > /tmp/zabbix-`date +%Y-%m-%d-%H-%M`.sql.gz
