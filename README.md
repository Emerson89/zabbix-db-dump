# Zabbix Backup Banco

Este script realiza o backup do schema do banco

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
2 - Dump excluido as tabelas maiores
```

Após finalizar o processo de backup, caso queira testar o restore do banco:

Restaurando o banco do Zabbix

sudo bunzip2 < DBNAME-schema.sql.bz2 | mysql -u USUARIO -p DBNAME
