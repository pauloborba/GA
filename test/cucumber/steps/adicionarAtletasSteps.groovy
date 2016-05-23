package steps

import cucumber.api.PendingException
import gaatleta.AtletaController
import gaatleta.Atleta

import pages.AtletasPage
import pages.VerAtleta
import pages.CreateAtleta

this.metaClass.mixin(cucumber.api.groovy.Hooks)
this.metaClass.mixin(cucumber.api.groovy.EN)

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

