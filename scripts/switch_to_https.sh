#!/bin/bash
sed -i -e 's/http/https/g' /shared/seafile/conf/seahub && echo "Done :) " || echo "Fail :("
