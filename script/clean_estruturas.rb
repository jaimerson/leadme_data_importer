require 'csv'

csv = CSV.read('./raw_data/estruturas-curriculares.csv', headers: true, col_sep: ';')
(csv.headers - %w[id_curriculo nome_matriz id_curso]).each { |c| csv.delete(c) }

options = {
  col_sep: ';',
  encoding: 'utf-8',
  force_quotes: true,
  write_headers: true,
  headers: %w[id_curriculo nome_matriz id_curso]
}

CSV.open('./data/matrizes.csv', 'w', **options) do |file|
  csv.each do |row|
    file << row
  end
end
