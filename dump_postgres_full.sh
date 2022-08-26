#!/bin/bash

pg_dump -U zabbix zabbix | gzip > /tmp/zabbix-`date +%Y-%m-%d-%H-%M`.sql.gz


##CREATE DATABASE
# create database zabbix with owner "zabbix" enconding "UTF8" template "template0";

