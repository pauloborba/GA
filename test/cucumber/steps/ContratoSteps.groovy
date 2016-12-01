package steps

import ga.Contrato
import ga.ContratoController
import ga.Jogador
import ga.JogadorController
import ga.Clausula
import ga.ClausulasEmConflitoException

import pages.CadastrarJogador
import pages.NovoJogador
import pages.CadastrarContrato
import pages.NovoContrato

this.metaClass.mixin(cucumber.api.groovy.Hooks)
this.metaClass.mixin(cucumber.api.groovy.EN)

def adicionarJogador(String nome, String cpf, String posicao, Date nascimento) {
	def controlador = new JogadorController()
	def jogador = new Jogador(nome: nome, cpf: cpf, dataDeNascimento: nascimento, posicao: posicao)
	controlador.salvar(jogador)
	controlador.response.reset()
}

def novoContrato(String atleta, Double salario, Date inicioVigencia, int duracaoMeses) {
	def controlador = new JogadorController()
	def contrato = new Contrato([salario: salario, inicial: inicioVigencia, termino: inicioVigencia + (duracaoMeses * 30)])
	def jogador = Jogador.findByNome(atleta)
	jogador.addContrato(contrato)
	controlador.salvar(jogador)
}

//CONTROLADOR

//teste 1

def contratosant = Contrato.findAll().size()

Given(~/^o atleta "([^"]*)" de CPF "([^"]*)", data de nascimento "([^"]*)" e posição "([^"]*)" já está cadastrado no sistema$/) { String atleta, cpf, nascimento, posicao ->
	adicionarJogador(atleta, cpf, posicao, Date.parse("dd/MM/yyyy", nascimento))
}

When(~/^eu tento cadastrar um contrato para o atleta "([^"]*)" de CPF "([^"]*)" com as cláusulas "([^"]*)" e "([^"]*)" selecionadas$/) { String atleta, cpf, c1, c2 ->
	def contrato = new Contrato([inicial: new Date(), termino: (new Date()) + 2, salario: 1000, valido: true])
	try {
		contrato.addClausula(Clausula.find("from Clausula c where c.numero=?", [c1.toInteger()]))
		contrato.addClausula(Clausula.find("from Clausula c where c.numero=?", [c2.toInteger()]))
		def c = new ContratoController()
		c.salvar(contrato)
	} catch(ClausulasEmConflitoException e) {}
}

Then(~/^o contrato não é armazenado no sistema$/) { ->
	assert Contrato.findAll().size() == contratosant
}

//teste 2

And(~/^o atleta "([^"]*)" não tem nenhum contrato$/) { String atleta ->
	assert Jogador.findByNome(atleta).contratos.findAll().size() == 0
}

When(~/^eu crio um novo contrato para o atleta "([^"]*)" com salário de "([^"]*)", com vigência a partir de "([^"]*)" e duração de "([^"]*)" mêses$/) { String atleta, salario, datainicial, duracao->
	novoContrato(atleta, Double.parseDouble(salario), Date.parse("dd/MM/yyyy", datainicial), duracao.toInteger()) 
}

Then(~/^o contrato é armazenado no sistema$/) { ->
	assert Contrato.findAll().size() == 1
}

//GUI

def cadastroContrato(String atleta, String salario, String mesescontrato, Date inicio) {
	to CadastrarContrato
	at CadastrarContrato
	page.preenche("txt_atleta", atleta)
	page.selecionaAtleta(atleta)
	page.preenche("txt_salario", salario)
	page.preenche("txt_vigencia", mesescontrato)
	page.preenche("txt_datainicio", inicio.format("dd/MM/yyyy"))
	page.cadastrar()
}

def cadastroAtletaGui(String atleta, String cpf, Date nascimento, String posicao) {
	to CadastrarJogador
	at CadastrarJogador
	page.preenche("txt_atleta", atleta)
	page.preenche("txt_cpf", cpf)
	page.preenche("txt_nascimento", nascimento.format("dd/MM/yyyy"))
	page.seleciona("select_posicao", posicao)
	page.cadastrar()
	at NovoJogador
	assert page.cadastroOk()
}

//teste 1

Given(~/^o atleta "([^"]*)" já está cadastrado$/) { String atleta ->
	cadastroAtletaGui(atleta, "123.123.123-12", (new Date()) - 1, "atacante")
}

And(~/^eu estou na página de cadastro de novo contrato$/) { ->
	to CadastrarContrato
	at CadastrarContrato
}

When(~/^eu cadastro um contrato para o atleta "([^"]*)" com salário de "([^"]*)", duração de "([^"]*)" mêses e vinculo a partir de hoje$/) { String atleta, salario, mesescontrato ->
	cadastroContrato(atleta, salario, mesescontrato, new Date())
}

Then(~/^eu vejo uma mensagem de contrato cadastrado com sucesso$/) { ->
	at NovoContrato
	assert page.cadastroOk()
}

//teste 2

When(~/^eu tento cadastrar dois contratos com datas de vigência coincidentes para o atleta "([^"]*)"$/) { String atleta ->
	cadastroContrato(atleta, "10000", "12", new Date() + 30)
	cadastroContrato(atleta, "10000", "12", new Date() + 30)
}

Then(~/^eu vejo uma mensagem de erro de contratos conflitantes$/) { ->
	at NovoContrato
	assert page.conflitoDatas()
}

After() {
	Jogador.findAll().each {
		it.delete(flush: true)
	}
}
