
arquivo = open('matriculas-uniq.csv', 'w')
arquivo.write("id_turma;num_reprovados;num_aprovados;media_aprovados;codigo_turma;id_docente_interno;id_docente_externo;id_componente_curricular;ano;periodo")

ids = []

for linhaMatricula in open("matriculas.csv", "r"):
	dadosMatricula = linhaMatricula.split(";")
	if(not dadosMatricula[0] in ids):
		ids.append(dadosMatricula[0])
		print("Adicionando a turma " + dadosMatricula[0])
		arquivo.write(linhaMatricula)

arquivo.close()