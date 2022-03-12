# Zabbix Backup Banco

## Para backup Mysql

Este script realiza o backup do schema do banco

Editar os seguintes campos no script:

- DBNAME=NAMEDB
- DBUSER=USERBANCO
- DBPASS=SENHABANCO

```
chmod +x dump_script_mysql.sh

./dump_script_mysql.sh
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
chmod +x dump_script_postgresql.sh

./dump_script_postgresql.sh
```
O Backup é slavo no /tmp altere conforme a necessidade 

Caso utilize Timescaledb deve se criar novalmente a extensão
```
 echo "CREATE EXTENSION IF NOT EXISTS timescaledb CASCADE;" | sudo -u postgres psql zabbix
```
Feito realize o restore 
```
zcat /tmp/zabbix-2022-03-11-12:08.sql.gz | psql -U zabbix zabbix
```
No exemplo cron a rotina de retenção de arquivo de backups para um 1 dia utilizando find altere conforme a necessidade
```
find /tmp -type f -name "*.gz" -mtime 1 -exec rm -f {} \;
```
