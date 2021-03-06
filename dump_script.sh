#!/bin/bash

DBNAME=NAMEDB
DBUSER=USERBANCO
DBPASS=SENHABANCO

rpm -qs pv &> /dev/null
if [ $? -ne 0 ]
   then
      echo "=======Pacote pv não instalado======="
      sleep 3
      echo "=======Instalando pv=========="
      sudo yum install pv -y
   else
      echo
      echo "=======Pacote pv já instalado======="
fi
echo
echo -e "Escolha a opção desejada: \n1 - Dump completo\n2 - Dump excluido as tabelas history trends"
echo

while :
do
  read INPUT
  case $INPUT in
       1)
         mysqldump --no-tablespaces -u"$DBUSER" -p"$DBPASS" "$DBNAME" --single-transaction | pv | gzip > "$DBNAME-`date +%Y-%m-%d`.sql.gz"
         echo
         sleep 2
         echo "=======Backup Realizado======"
         echo
         break
         ;;
       2)
         mysqldump --no-tablespaces -u"$DBUSER"  -p"$DBPASS" "$DBNAME" --single-transaction \
         --ignore-table="$DBNAME.history" \
         --ignore-table="$DBNAME.history_log" \
         --ignore-table="$DBNAME.history_str" \
         --ignore-table="$DBNAME.history_str_sync" \
         --ignore-table="$DBNAME.history_sync" \
         --ignore-table="$DBNAME.history_text" \
         --ignore-table="$DBNAME.history_uint" \
         --ignore-table="$DBNAME.history_uint_sync" \
         --ignore-table="$DBNAME.trends" \
         --ignore-table="$DBNAME.trends_uint" \
        | pv | gzip > "$DBNAME-`date +%Y-%m-%d`.sql.gz"
         
         echo
         echo "=======Backup realizado======="
         break
         ;;
       *)
         echo  "======Não existe está opção======="
         ;;
  esac
done