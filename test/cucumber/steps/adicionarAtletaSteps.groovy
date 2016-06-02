package steps

import cucumber.api.PendingException
import ga.AtletaController
import ga.Atleta

import page.AtletasPage
import page.CreateAtleta
this.metaClass.mixin(cucumber.api.groovy.Hooks)
this.metaClass.mixin(cucumber.api.groovy.EN)
//Scenario: Adicionar Atleta sem sucesso

Given(~'^Um atleta de CPF "([^"]*)" se encontra cadastrado no sistema$') { String nome, cpf ->
	def controlador = new AtletaController()
	createAtleta("Edinaldo", cpf, controlador)
	assert Atleta.findByCpf(cpf) != null
}

When(~'^Tento cadastrar um novo atleta "([^"]*)" com o CPF "([^"]*)"$') { String nome, cpf ->
	def controlador = new AtletaController()
	verificaAtleta  (nome, cpf, controlador)
}

Then(~'^O sistema não permite o cadastro duplicado do CPF "([^"]*)"$') { String cpf ->
	atleta = Atleta.findAllByCpf(cpf)
	assert atletas.size()==1
}

def createAtleta(String nome, String cpf, AtletaController controlador) {
	controlador.params << [cpf: cpf, nome: nome]
	controlador.save()
	controlador.response.reset()
	// eddy tromba
}

def verificaAtleta(String nome, String cpf, AtletaController controlador) {
	if (Atleta.findByCpf(cpf)==null) {
		controlador.params << [cpf: cpf, nome: nome]
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

And(~'^Tento cadastrar um novo atleta "([^"]*)" com o CPF "([^"]*)$'){ String nome, cpf ->
	to CreateAtleta
	at CreateAtleta
	page.verificaAtleta(nome, cpf)
}

Then(~'Eu posso ver que na página de Atletas que o no atleta não foi adicionado$'){->
	to AtletasPage
	at AtletasPage
}

//criar AtletasPage