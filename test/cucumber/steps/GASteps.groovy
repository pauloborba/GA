package steps

import ga.Contrato
import ga.ContratoController
import ga.Jogador
import ga.JogadorController
import pages.AtletaCreate
import pages.AtletaShow
import pages.AtletasPage

this.metaClass.mixin(cucumber.api.groovy.Hooks)
this.metaClass.mixin(cucumber.api.groovy.EN)

def adicionarJogador(String cpf, JogadorController controlador){
    def jogador = new Jogador([nome: "nome", cpf: cpf])
    controlador.save(jogador)
}

def adicionarContrato(String nomeContrato, cpfAtleta, ContratoController controlador){
    def atleta = Jogador.findByCpf(cpfAtleta)
    def contrato = new Contrato(valido: true, nome: nomeContrato, jogador: atleta, salario: 1230)
    controlador.save(contrato)
}

def verContrato(String nomeContrato, cpfAtleta){ //retorna se o contrato especificado tem determinado atleta
    def contrato = Contrato.findByNome(nomeContrato)
    return contrato.getJogador().cpf == cpfAtleta
}

def desativarJogador(String cpfAtleta, JogadorController controlador){
    def atleta = Jogador.findByCpf(cpfAtleta)
    controlador.desative(atleta)
}

def removerJogador(String cpfAtleta, JogadorController controlador){
    def atleta = Jogador.findByCpf(cpfAtleta)
    controlador.delete(atleta)
}

Given(~/^o atleta com cpf "([^"]*)" está cadastrado$/) { String atleta ->
    def controlador = new JogadorController()
    adicionarJogador(atleta, controlador)
    assert Jogador.findByCpf(atleta) //
}

And(~/^"([^"]*)" tem o contrato "([^"]*)"$/) { String atleta, contrato ->
    def controlador = new ContratoController()
    adicionarContrato(contrato, atleta, controlador)
    assert verContrato(contrato, atleta)
}

When(~/^"([^"]*)" é desativado$/) { String atleta ->
    def controlador = new JogadorController()
    desativarJogador(atleta, controlador)
    assert !Jogador.findByCpf(atleta).ativo
}

Then(~/^o contrato "([^"]*)" é inativado$/) { String nomeContrato ->
    // Write code here that turns the phrase above into concrete actions
    def contrato = Contrato.findByNome(nomeContrato)
    assert !contrato.valido
}

When(~/^é tentado remover "([^"]*)"$/) { String atleta ->
    def controlador = new JogadorController()
    removerJogador(atleta, controlador)
}

Then(~/^"([^"]*)" não é removido$/) { String atleta ->
    assert Jogador.findByCpf(atleta) != null
}



Given(~/^estou na página de atletas$/) { ->
    to AtletasPage
    at AtletasPage
}

And(~/^criei um atleta com cpf "([^"]*)"$/) { String atleta ->
    at AtletasPage
    to AtletaCreate
    at AtletaCreate
    page.adicionarAtleta("nome", atleta)
    at AtletaShow
//    to AtletasPage
//    at AtletasPage
//    assert page.atletaNaLista(atleta)
}


And(~/^desativei o atleta selecionado$/){ ->
//    at AtletasPage
//    to AtletaShow
    at AtletaShow
    page.desativarAtleta()
    at AtletasPage
}

When(~/^seleciono o atleta de cpf "([^"]*)"$/) { String atleta ->
    at AtletasPage
    page.selecionarAtleta(atleta)
    at AtletaShow
}

And(~/^tento remover o atleta selecionado$/) { ->
    at AtletaShow
    page.removerAtleta()
    at AtletasPage
}


Then(~/^vejo a página de atletas sem "([^"]*)"$/) { String atleta ->
    at AtletasPage
    assert !page.procurarAtleta(atleta)
}


Then(~/^vejo que não há opção para editá-lo$/) { ->
    at AtletaShow
    assert !page.atletaEditavel()
}