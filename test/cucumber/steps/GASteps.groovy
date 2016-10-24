package steps

import ga.Jogador
import ga.JogadorController

this.metaClass.mixin(cucumber.api.groovy.Hooks)
this.metaClass.mixin(cucumber.api.groovy.EN)

def adicionarJogador(String nome, JogadorController controlador){
    def jogador = new Jogador([nome: nome])
    controlador.save(jogador)
//    controlador.response.reset()
}

def adicionarContrato(String atleta, nomeContrato, JogadorController controlador){
    def contrato = new Contrato(valido: true, nome: nomeContrato)

}

def buscaContrato(String atleta, contrato, JogadorController controlador){

}

def removerJogador(String atleta, JogadorController controlador){

}

Given(~/^o atleta "([^"]*)" está cadastrado$/) { String atleta ->
    def controlador = new JogadorController()
    adicionarJogador(atleta, controlador)
    assert Jogador.findByNome(atleta) //se não encontra atleta com nome atleta lança exceção
}
And(~/^"([^"]*)" tem o contrato "([^"]*)"$/) { String atleta, contrato ->
    // Write code here that turns the phrase above into concrete actions
    def controlador = new JogadorController()
    adicionarContrato(atleta, contrato, controlador)
    assert buscaContrato(atleta, contrato, controlador)
}
When(~/^"([^"]*)" é removido$/) { String atleta ->
    def controlador = new JogadorController()
    removerJogador(atleta, controlador)
    assert Jogador.findByNome(atleta) == null
}

Then(~/^o contrato "([^"]*)" é inativado$/) { String contrato ->
    // Write code here that turns the phrase above into concrete actions
    assert Contrato.findByNome(contrato).valido == false
}

Given(~/^estou na página de remoção$/) { ->
    // Write code here that turns the phrase above into concrete actions
}
And(~/^"([^"]*)" foi marcado para ser removido$/) { String arg1 ->
    // Write code here that turns the phrase above into concrete actions
}
When(~/^eu solicito a remoção dos marcados$/) { ->
    // Write code here that turns the phrase above into concrete actions
}
Then(~/^vejo uma página de confirmação da remoção de "([^"]*)"$/) { String arg1 ->
    // Write code here that turns the phrase above into concrete actions
}
And(~/^em seguida vejo uma página com uma nova lista sem "([^"]*)"$/) { String arg1 ->
    // Write code here that turns the phrase above into concrete actions
}
Given(~/^estou na página de confirmação de remoção de "([^"]*)" e "([^"]*)"$/) { String arg1, String arg2 ->
    // Write code here that turns the phrase above into concrete actions
}
And(~/^seleciono apenas "([^"]*)"$/) { String arg1 ->
    // Write code here that turns the phrase above into concrete actions
}
When(~/^solicito a remoção$/) { ->
    // Write code here that turns the phrase above into concrete actions
}
Then(~/^vejo uma mensagem de remoção realizada com sucesso$/) { ->
    // Write code here that turns the phrase above into concrete actions
}
Given(~/^estou na página de confirmação de remoção de "([^"]*)"$/) { String arg1 ->
    // Write code here that turns the phrase above into concrete actions
}
And(~/^não seleciono "([^"]*)"$/) { String arg1 ->
    // Write code here that turns the phrase above into concrete actions
}
Then(~/^vejo uma mensagem informando que "([^"]*)" não foi removido$/) { String arg1 ->
    // Write code here that turns the phrase above into concrete actions
}
And(~/^em seguida vejo uma página com uma lista com "([^"]*)"$/) { String arg1 ->
    // Write code here that turns the phrase above into concrete actions
}
Given(~/^que ninguém foi marcado para ser removido$/) { ->
    // Write code here that turns the phrase above into concrete actions
}
Then(~/^vejo uma mensagem de aviso$/) { ->
    // Write code here that turns the phrase above into concrete actions
}