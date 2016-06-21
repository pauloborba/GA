package steps

import ga.AtletaController
import ga.Atleta

import page.AtletasPage
import page.CreateAtleta
this.metaClass.mixin(cucumber.api.groovy.Hooks)
this.metaClass.mixin(cucumber.api.groovy.EN)

//edymir---------------------------------------------------------------------------------------------------------------------------
Given(~'^Um atleta de CPF "([^"]*)" se encontra cadastrado no sistema$') { String cpf ->
	def controlador = new AtletaController()
	cadastrAtleta("Edinaldo", cpf, null, controlador)
	assert Atleta.findByCpf(cpf) != null
}

When(~'^Tento cadastrar um novo atleta "([^"]*)" com o CPF "([^"]*)"$') { String nome, cpf ->
	def controlador = new AtletaController()
	cadastrAtleta (nome, cpf, null, controlador)
}

Then(~'^O sistema não permite o cadastro duplicado do CPF "([^"]*)"$') { String cpf ->
	atletas = Atleta.findAllByCpf(cpf)
	assert atletas.size()==1
}

def cadastrAtleta(String nome, String cpf, Date dataNascimento, AtletaController controlador) {
		controlador.params << [cpf: cpf, nome: nome, dataNascimento: dataNascimento]
		controlador.save(new Atleta(cpf: cpf, nome: nome, dataNascimento: dataNascimento))
		controlador.response.reset()
}

//web
//Given(~'^Um atleta de CPF "([^"]*)" se encontra cadastrado$'){ String cpf ->
//	to CreateAtleta
//	at CreateAtleta
//	page.cadastrAtleta("Jankaukas", cpf)
//	to AtletasPage
//	at AtletasPage
//	assert page.existeCPF(cpf)
//}
//
//And(~'^Estou no menu Atletas$'){->
//	to AtletasPage
//	at AtletasPage
//}
//
//
//When(~'^Seleciono a opção Adicionar Atleta$'){->
//	to CreateAtleta
//    at CreateAtleta
//}
//
//And(~'^Tento cadastrar um novo atleta "([^"]*)" com o CPF "([^"]*)$'){ String nome, cpf ->
//	to CreateAtleta
//	at CreateAtleta
//	page.cadastrAtleta(nome, cpf)
//}
//
//Then(~'Eu posso ver que na página de Atletas que o no atleta não foi adicionado$'){->
//	to AtletasPage
//	at AtletasPage
//}
//edymir-end--------------------------------------------------------------------------------------------------------------------

//Abaixo, steps de silvaemanuel

Given(~'^O atleta de CPF "([^"]*)" não esta cadastrado no sistema$') { String cpf ->
    assert Atleta.findByCpf(cpf) == null
}

When(~'^Eu cadastro o atleta de CPF "([^"]*)"$') { String cpf ->
    def contrlador = new AtletaController()
	cadAtletaComCpf("Edinaldo", cpf, null, contrlador)
}

Then(~'^O sistema adiciona o atleta de CPF "([^"]*)" com sucesso$') { String cpf ->
	atlta = Atleta.findByCpf(cpf)
	assert atlta.cpf == cpf
}

def cadAtletaComCpf(String nome, String cpf, Date dataNascimento, AtletaController controlador) {
	controlador.params << [cpf: cpf, nome: nome, dataNascimento: dataNascimento]
	controlador.save(new Atleta(cpf: cpf, nome: nome, dataNascimento: dataNascimento))
	controlador.response.reset()
}
Given(~'^Estou no menu de Atletas$') { ->
    to AtletasPage
    at AtletasPage
}

And(~'^O atleta de CPF "([^"]*)" e nome "([^"]*)" não esta na lista de atletas$') {String nome, cpf->
    at AtletasPage
    assert !(page.temAtleta(cpf))
}

When(~'^Eu tento cadastrar o atleta "([^"]*)" com o CPF "([^"]*)"$') { String nome, cpf ->
    to CreateAtleta
    at CreateAtleta
    page.cadastrarAtleta(nome, cpf)
}

Then(~'^Eu posso ver o nome "([^"]*)" e CPF "([^"]*)"$ na lista de atletas') { String nome, cpf ->
    at VerAtleta
    assert page.temNome(nome) == true
    assert page.temCpf(cpf) == true
}
