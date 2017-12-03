require 'csv'

csv = CSV.read('./data/cursos-graduacao.csv', headers: true, col_sep: ';')
(csv.headers - %w[id_curso nome grau_academico modalidade_educacao]).each { |c| csv.delete(c) }

options = {
  col_sep: ';',
  encoding: 'utf-8',
  force_quotes: true,
  write_headers: true,
  headers: %w[id_curso nome grau_academico modalidade_educacao]
}

CSV.open('./data/cursos.csv', 'w', **options) do |file|
  csv.each do |row|
    file << row
  end
end
