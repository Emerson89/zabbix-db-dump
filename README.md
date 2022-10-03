# Zabbix Backup Banco

## Para backup Mysql

Este script realiza o backup do schema do banco

Para alguns banco mysql é preciso colocar o parametro --set-gtid-purged=OFF
```
mysqldump --no-tablespaces -u"$DBUSER" -p"$DBPASS" "$DBNAME" --single-transaction --set-gtid-purged=OFF | gzip > "$DBNAME-`date +%Y-%m-%d-%H-%M`.sql.gz"
```
Editar os seguintes campos no script:

- DBNAME=NAMEDB
- DBUSER=USERBANCO
- DBPASS=SENHABANCO

```
chmod +x dump_script.sh

./dump_script.sh
```
Escolha uma das opções para dump:

```
Escolha a opção desejada: 
1 - Dump completo
2 - Dump excluido as tabelas history e trends
```

Após finalizar o processo de backup, caso queira testar o restore do banco:

Restaurando o banco do Zabbix

sudo gunzip < DBNAME-schema.sql.gz | mysql -u USUARIO -p DBNAME

## Para backup postgresql

```
chmod +x dump_postgresql_full.sh

./dump_postgresql_full.sh 
or
./dump_postgresql_exclude.sh

```
O Backup é salvo no /tmp altere conforme a necessidade 

Caso utilize Timescaledb deve se criar novamente a extensão

```
sudo -u postgres createdb -O zabbix zabbix --> cria database
or
create database zabbix with owner "zabbix" enconding "UTF8" template "template0";

echo "CREATE EXTENSION IF NOT EXISTS timescaledb CASCADE;" | sudo -u postgres psql zabbix
```
Feito realize o restore 
```
zcat /tmp/zabbix-2022-03-11-12:08.sql.gz | psql -U zabbix zabbix
```
## Utiliza cron

Basta utilizar o exemplo cron altere o tipo do banco conformed a necessidade

No exemplo cron a rotina de retenção de arquivo de backups para um 1 dia utilizando find altere conforme a necessidade
```
find /tmp -type f -name "*.gz" -mtime 1 -exec rm -f {} \;
```
