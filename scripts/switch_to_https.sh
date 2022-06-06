#!/bin/bash
set -o errexit

if [[ -f /opt/seafile/conf/seahub_settings.py ]]; then
    echo "Changing http to https in seahub_settings.py"
    sed -i -e 's#http://#https://#g' /opt/seafile/conf/seahub_settings.py
    /opt/seafile/seafile-server-latest/seahub.sh restart
else 
    echo "File not found: /opt/seafile/conf/seahub_settings.py. Exiting.."
    exit 1
fi

