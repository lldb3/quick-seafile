#!/bin/bash

if [[ -f .env ]]; then
  export $(echo $(cat .env | sed 's/#.*//g'| xargs) | envsubst)
fi

sed -i -E "s#OFFICE_CONVERTOR_ROOT.*#OFFICE_CONVERTOR_ROOT = 'http://office-preview:8089'#g"  $DATADIR/seafile_data/conf/seahub_settings.py


SECRET_KEY=$(grep "SECRET_KEY" $DATADIR/seafile_data/conf/seahub_settings.py | grep -Eo '".+"')


echo """
# Make sure the SECRET_KEY is the same as value in seahub_settings.py
SECRET_KEY = $SECRET_KEY  

WORKERS = 10                   # worker number
OUTPUT_DIR = '/shared/output'  # output folder in container
PORT = 8089                    # port in container

""" > $DATADIR/office-preview/shared/office_convertor_settings.py


docker compose restart seafile office-preview