#!/bin/bash
TURMAS_CSV="$PWD/data/resultado2017.csv"
CURSO_CSV="$PWD/data/cursos.csv"

cat ./import_data.sql \
    | awk "{gsub(/__TURMA_CSV_PATH__/, \"$TURMAS_CSV\"); print $1;}" \
    | awk "{gsub(/__CURSO_CSV_PATH__/, \"$CURSO_CSV\"); print $1;}" \
    > ./tmp.sql
psql -d leadme_topicos -f ./tmp.sql
rm ./tmp.sql
