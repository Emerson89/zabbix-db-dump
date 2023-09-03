#!/bin/bash

DBUSER="zabbix"
DBPASS="zabbix"
DBHOST="127.0.0.1"
DBNAME="zabbix"

pg_dump --dbname=postgresql://$DBUSER:$DBPASS==@$DBHOST:5432/$DBNAME -v -F custom \
| gzip > /tmp/zabbix-`date +%Y-%m-%d-%H-%M`.sql.gz


##CREATE DATABASE
# create database zabbix with owner "zabbix" enconding "UTF8" template "template0";

