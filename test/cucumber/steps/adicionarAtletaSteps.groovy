package steps

import cucumber.api.PendingException
import ga.AtletaController
import ga.Atleta
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
