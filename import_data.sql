-- Replace __CSV_PATH__ with the absolute path if using this sql directly
-- import turma
BEGIN TRANSACTION;

COPY turma (
  id, numeroReprovados, numeroAprovados, mediaNotas,
  codigoTurma, idDocente, idDocenteExterno, idComponenteCurricular,
  ano, periodoLetivo
) FROM '__TURMA_CSV_PATH__'
CSV
HEADER
DELIMITER ';';

END TRANSACTION;

-- import curso
BEGIN TRANSACTION;

COPY curso (
  id, nome, grauAcademico, modalidade
) FROM '__CURSO_CSV_PATH__'
CSV
HEADER
DELIMITER ';';

END TRANSACTION;

-- import matrizes

BEGIN TRANSACTION;

CREATE TEMPORARY TABLE temp_matriz(id INT, nomeMatriz VARCHAR(255), curso_id INT) ON COMMIT DROP;

COPY temp_matriz (
  id, nomeMatriz, curso_id
) FROM '__ESTRUTURAS_CSV_PATH__'
CSV
HEADER
DELIMITER ';';

INSERT INTO matrizcurricular (id, nomeMatriz, curso_id)
SELECT temp_matriz.id, nomeMatriz, curso_id FROM temp_matriz
INNER JOIN curso ON curso.id = temp_matriz.curso_id;

END TRANSACTION;

-- import disciplinas

BEGIN TRANSACTION;

COPY disciplina (
  id, codigo, nome, cargaHoraria, equivalencias, preRequisitos, coRequisitos
) FROM '__DISCIPLINA_CSV_PATH__'
CSV
HEADER
DELIMITER ';';

END TRANSACTION;

-- import matrizDisciplinas

BEGIN TRANSACTION;

CREATE TEMPORARY TABLE temp_matriz_disciplina (
  id INT,
  matriz_id INT,
  disciplina_id INT,
  naturezaDisciplina VARCHAR(255)
) ON COMMIT DROP;

COPY temp_matriz_disciplina (
  id, matriz_id, disciplina_id, naturezaDisciplina
) FROM '__MATRIZ_DISCIPLINA_CSV_PATH__'
CSV
HEADER
DELIMITER ';';

INSERT INTO matrizdisciplina (
  id, matriz_id, disciplina_id, naturezaDisciplina
) SELECT temp_matriz_disciplina.id, matriz_id, disciplina_id, naturezaDisciplina
FROM temp_matriz_disciplina
INNER JOIN matrizcurricular ON matrizcurricular.id = temp_matriz_disciplina.matriz_id
INNER JOIN disciplina ON disciplina.id = temp_matriz_disciplina.disciplina_id;

END TRANSACTION;
