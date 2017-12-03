require 'csv'

csv = CSV.read('./data/componentes-curriculares-presenciais.csv', headers: true, col_sep: ';')
(csv.headers - %w[id_componente codigo nome ch_total equivalencia pre_requisito co_requisito]).each { |c| csv.delete(c) }

options = {
  col_sep: ';',
  encoding: 'utf-8',
  force_quotes: true,
  write_headers: true,
  headers: %w[id_componente codigo nome ch_total equivalencia pre_requisito co_requisito]
}

CSV.open('./data/disciplinas.csv', 'w', **options) do |file|
  csv.each do |row|
    file << row
  end
end
