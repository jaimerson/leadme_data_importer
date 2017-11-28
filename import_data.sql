-- Replace __CSV_PATH__ with the absolute path if using this sql directly
BEGIN TRANSACTION;

COPY turma (
  id, numeroReprovados, numeroAprovados, mediaNotas,
  codigoTurma, idDocente, idDocenteExterno, idComponenteCurricular,
  ano, periodoLetivo
) FROM '__CSV_PATH__'
CSV
HEADER
DELIMITER ';';

END TRANSACTION;
