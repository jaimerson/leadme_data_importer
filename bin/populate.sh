#!/bin/bash
TURMAS_CSV="$PWD/data/matriculas-uniq.csv"
CURSO_CSV="$PWD/data/cursos.csv"
ESTRUTURAS_CSV="$PWD/data/matrizes.csv"
DISCIPLINA_CSV="$PWD/data/disciplinas.csv"
MATRIZ_DISCIPLINA_CSV="$PWD/data/matrizes_disciplina.csv"

cat ./import_data.sql \
    | awk "{gsub(/__TURMA_CSV_PATH__/, \"$TURMAS_CSV\"); print $1;}" \
    | awk "{gsub(/__CURSO_CSV_PATH__/, \"$CURSO_CSV\"); print $1;}" \
    | awk "{gsub(/__ESTRUTURAS_CSV_PATH__/, \"$ESTRUTURAS_CSV\"); print $1;}" \
    | awk "{gsub(/__DISCIPLINA_CSV_PATH__/, \"$DISCIPLINA_CSV\"); print $1;}" \
    | awk "{gsub(/__MATRIZ_DISCIPLINA_CSV_PATH__/, \"$MATRIZ_DISCIPLINA_CSV\"); print $1;}" \
    > ./tmp.sql
psql -d leadme_topicos -f ./tmp.sql
rm ./tmp.sql
