package steps

import cucumber.api.PendingException
import ga.AtletaController
import ga.Atleta
import steps.AtletaTestAndDataOperations

import page.AtletasPage
import page.CreateAtleta
this.metaClass.mixin(cucumber.api.groovy.Hooks)
this.metaClass.mixin(cucumber.api.groovy.EN)
//Scenario: Adicionar Atleta sem sucesso

Given(~'^Um atleta de nome "([^"]*)" e CPF "([^"]*)" se encontra cadastrado no sistema$') { String nome, cpf ->
	def controlador = new AtletaController()
	createAtleta(nome, cpf,controlador)
	assert AtletaTestAndDataOperations.findByCpf(cpf) == null
}

When(~'^Tento cadastrar um novo atleta "([^"]*)" com o CPF "([^"]*)"$') { String nome, cpf ->
	def controlador = new AtletaController()
	verificaAtleta  (nome, cpf, controlador)
}

Then(~'^O sistema não permite o cadastro duplicado do CPF "([^"]*)"$') { String cpf ->
	def atleta = AtletaTestAndDataOperations.findByCpf(cpf)
	assert atleta == null
}

def createAtleta(String nome, String cpf, AtletaController controlador) {
	controlador.params << [nome: nome, cpf: cpf]
	controlador.save()
	controlador.response.reset()
	// eddy tromba
}

def verificaAtleta(String nome, String cpf, AtletaController controlador) {
	if (AtletaTestAndDataOperations.findByCpf(cpf)==null) {
		controlador.params << [nome: nome, cpf: cpf]
		controlador.save()
		controlador.response.reset()
	}
	else{
		flush.message = "CPF já cadastrado"
	}
}
