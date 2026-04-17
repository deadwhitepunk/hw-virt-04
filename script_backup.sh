#!/bin/bash
docker run \
    --rm --entrypoint "" \
    -v /opt/backup/:/backup \
    --link="shvirtd-example-python-db-1:alias" \
    --network=shvirtd-example-python_backend \
    schnitzler/mysqldump \
    mysqldump --opt -h alias -u $MYSQL_USER -p"$MYSQL_ROOT_PASSWORD" --result-file="/backup/dumps_$(date +'%Y%m%d_%H%M%S').sql" virtd