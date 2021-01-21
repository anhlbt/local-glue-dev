#!/bin/bash

ROOT_DIR="$(cd $(dirname "$0"); pwd)"

aws s3api create-bucket \
    --bucket test-bucket \
    --endpoint-url http://localstack:4566

mysql -h db -P3306 -uroot -ptest < $ROOT_DIR/mysql.sql
