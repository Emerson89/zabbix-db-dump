#!/bin/bash

DBNAME=NAMEDB
DBUSER=USERBANCO
DBPASS=SENHABANCO

mysqldump --no-tablespaces -u"$DBUSER" -p"$DBPASS" "$DBNAME" --single-transaction | gzip > "$DBNAME-`date +%Y-%m-%d`.sql.gz"

echo "=======Backup Realizado======"
