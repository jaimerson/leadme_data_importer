#!/bin/bash
PATH_TO_CSV="$PWD/data/resultado2017.csv"
cat ./import_data.sql | awk "{gsub(/__CSV_PATH__/, \"$PATH_TO_CSV\"); print $1;}" > ./tmp.sql
psql -d leadme_topicos -f ./tmp.sql
rm ./tmp.sql
