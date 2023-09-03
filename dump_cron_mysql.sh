#!/bin/bash

DBNAME=NAMEDB
DBUSER=USERBANCO
DBPASS=SENHABANCO
DBHOST="127.0.0.1"

mysqldump --no-tablespaces -h"$DBHOST" -u"$DBUSER" -p"$DBPASS" "$DBNAME" --single-transaction | gzip > "$DBNAME-`date +%Y-%m-%d-%H-%M`.sql.gz"

echo "=======Backup Realizado======"
