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
