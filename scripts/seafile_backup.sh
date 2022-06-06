#!/bin/bash
## Info: https://manual.seafile.com/docker/pro-edition/deploy_seafile_pro_with_docker/#backup-and-recovery

START="$(date +%s)"

echo "Should be run in project folder (where the docker-compose.yml file is)"

if [[ -n $1 ]]; then
    echo "Will be using $1 as destination for the backup"
    if [[ ! -e $1 ]]; then
        mkdir -p "$1/databases"
    fi
else 
    echo "Please provide the destination folder for the backup as argument"
    exit 1
fi

DESTDIR=$1

if [[ -f .env ]]; then
  export $(echo $(cat .env | sed 's/#.*//g'| xargs) | envsubst)
fi


for i in {seafile-data,seahub-data,conf};do
    rsync -az $DATADIR/seafile_data/$i $DESTDIR/
done

for i in {ccnet_db,seafile_db,seahub_db};do
    docker compose exec -it db  mysqldump -uroot -p"$DB_MARIADB_PASSWORD" --opt $i > $DESTDIR/databases/$i.sql
done

DURATION=$(( $(date +%s) - ${START} ))

echo "Done, backup took "$DURATION"s"