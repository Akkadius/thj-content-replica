#!/usr/bin/env bash

CWD=$(pwd)
source $CWD/.env

export TZ

mysqldump \
  --skip-lock-tables \
  -h $CONTENT_IP \
  -P $CONTENT_PORT \
  -u $CONTENT_USER \
  -p$CONTENT_PASSWORD \
  $CONTENT_DB \
  | mysql \
    -h mariadb \
    -P 3306 \
    -u $MARIADB_USER \
    -p$MARIADB_PASSWORD \
    $MARIADB_DATABASE

