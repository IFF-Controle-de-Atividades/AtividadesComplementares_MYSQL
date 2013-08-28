#encoding:utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

threads = []

def inserir_modalidades
	Modalidade.create(title: "Participação em Curso")
	Modalidade.create(title: "Ministrante de Curso de Extensão")
	Modalidade.create(title: "Atividade de Iniciação Científica")
	Modalidade.create(title: "Publicação de Artigo Científico")
	Modalidade.create(title: "Publicação de Produção Autoral")
	Modalidade.create(title: "Participação em Concurso Acadêmico")
	Modalidade.create(title: "Serviço Voluntário")
	Modalidade.create(title: "Apresentação de Trabalho Científico")
	Modalidade.create(title: "Viagem de Estudo e Visita Técnica")
	Modalidade.create(title: "Realização de Curso de Idioma")
	Modalidade.create(title: "Participação como Ouvinte em banca de Trabalho de Conclusão")
	Modalidade.create(title: "Participação em Comissão Organizadora")
	Modalidade.create(title: "Exercício de Cargo Eletivo na Diretoria do DCE")
	Modalidade.create(title: "Exercício de Cargo Eletivo na Diretoria do CA do Curso")
	Modalidade.create(title: "Participação em Equipe Esportiva do IFF")
	Modalidade.create(title: "Certificação Profissional na Área do Curso")
end

def inserindo_administrador
 	Avaliador.create(nome: 'Administrador', sexo: 'Masculino', matricula: 'Altere sua matricula', titulacao: 'Alterar sua titulação', email: 'admin@admin.com', password: 'admin', admin: 1, ativo: 1)
end	

print "######################################################################################"
print "##############  Inserindo Modalidades Padronizadas  ##################################\n"
print "##############  Você pode inserir mais Modalidades de dentro do Sistema se assim desejar #######"

thr = Thread.new {inserir_modalidades}
thr.join
sleep(5)

print "############## Inserindo Administrador padrão do Sistema  ############################\n"
print "############## Os dados do administrador podem ser alterados posteriormente  ##############\n"
print "######################################################################################"
threads << Thread.new {inserindo_administrador}
sleep(5)
threads.each { |thr| thr.join }

print "\n\n<< Fim da excecução. Dados foram inseridos com sucesso >>\n\n"
