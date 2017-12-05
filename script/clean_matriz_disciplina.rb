require 'csv'

csv = CSV.read('../raw_data/curriculo-componente-graduacao.csv', headers: true, col_sep: ';')
(csv.headers - %w[id_curriculo_componente id_curriculo id_componente_curricular semestre_oferta tipo_vinculo_componente]).each { |c| csv.delete(c) }

options = {
  col_sep: ';',
  encoding: 'utf-8',
  force_quotes: true,
  write_headers: true,
  headers: %w[id_curriculo_componente id_curriculo id_componente_curricular semestre_oferta tipo_vinculo_componente]
}

CSV.open('../data/matrizes_disciplina.csv', 'w', **options) do |file|
  csv.each do |row|
    file << row
  end
end
