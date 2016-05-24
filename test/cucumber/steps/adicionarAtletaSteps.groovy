import cucumber.api.PendingException
import ga.AtletaController
import ga.Atleta

import pages.AtletasPage
import pages.CreateAtleta
this.metaClass.mixin(cucumber.api.groovy.Hooks)
this.metaClass.mixin(cucumber.api.groovy.EN)
//Scenario: Adicionar Atleta sem sucesso

Given(~'^Um atleta de CPF "([^"]*)" se encontra cadastrado no sistema$') { String cpf ->
	def controlador = new AtletaController()
	createAtleta("Edinaldo", cpf, controlador)
	assert Atleta.findByCpf(cpf) != null
}

When(~'^Tento cadastrar um novo atleta "([^"]*)" com o CPF "([^"]*)"$') { String nome, cpf ->
	def controlador = new AtletaController()
	verificaAtleta(nome, cpf, controlador)
}

Then(~'^O sistema não permite o cadastro duplicado do CPF "([^"]*)"$') { String cpf ->
	atleta = Atleta.findAllByCpf(cpf)
	assert atletas.size()==1
}

def createAtleta(String nome, String cpf, AtletaController controlador) {
	controlador.params << [cpf: cpf, nome: nome, dataNascimento: null]
	controlador.save()
	controlador.response.reset()
}

def verificaAtleta(String nome, String cpf, AtletaController controlador) {
	if (Atleta.findByCpf(cpf)==null) {
		controlador.params << [cpf: cpf, nome: nome, dataNascimento: null]
		controlador.save()
		controlador.response.reset()
	}
	else{
		flash.message = "CPF já cadastrado"
	}
}

//web
Given(~'^Um atleta de CPF "([^"]*)" se encontra cadastrado$'){ String cpf ->
	to CreateAtleta
	at CreateAtleta
	page.createAtleta("Jankaukas", cpf)
}

And(~'^Estou no menu Atletas$'){->
	to AtletasPage
	at AtletasPage
}


When(~'^Seleciono a opção Adicionar Atleta$'){->
	to CreateAtleta
	at CreateAtleta
}

And(~'^Cadastro um novo atleta "([^"]*)" com o CPF "([^"]*)"$'){ String nome, cpf ->
	to CreateAtleta
	at CreateAtleta
	page.verificaAtleta(nome, cpf)
}

Then(~'^Eu posso ver que na página de Atletas o no atleta não foi adicionado$'){->
	to AtletasPage
	at AtletasPage
}

//Abaixo, steps de silvaemanuel

Given(~'^O atleta de CPF "([^"]*)" não esta cadastrado no sistema$') { String cpf ->
    assert Atleta.findByCPF(cpf) == null
}

When(~'^Eu cadastro o atleta de CPF "([^"]*)"$') { String cpf ->
    def controlador = new AtletaController()
    cadastrarAtleta(cpf,controlador)
}

Then(~'^O sistema adiciona o atleta de CPF "([^"]*)" com sucesso$') { String cpf ->
    assert Atleta.findByCPF(cpf) != null
}

def cadastrarAtleta(String cpf, AtletaController controlador) {
    controlador.params << [cpf: cpf, nome: "", dataNascimento: null]
    controlador.save()
    controlador.response.reset()
}

Given(~'^Estou no menu de Atletas$') { ->
    to AtletasPage
    at AtletasPage
}

And(~'^O atleta de CPF "([^"]*)" e nome "([^"]*)" não esta na lista de atletas$') {String nome, cpf->
    at AtletasPage
    assert !(page.atletaNaLista(nome, cpf))
}

When(~'^Eu tento cadastrar o atleta "([^"]*)" com o CPF "([^"]*)"$') { String nome, cpf ->
    to CreateAtleta
    at CreateAtleta
    page.cadastrarAtleta(nome, cpf)
}

Then(~'^Eu posso ver a tela de visualização de Atleta e o nome "([^"]*)" e CPF "([^"]*)"$') { String nome, cpf ->
    at VerAtleta
    assert page.temNome(nome) == true
    assert page.temCpf(cpf) == true
}
