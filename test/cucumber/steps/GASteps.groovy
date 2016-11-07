package steps

import ga.Contrato
import ga.ContratoController
import ga.Jogador
import ga.JogadorController
import pages.RemocaoPage

this.metaClass.mixin(cucumber.api.groovy.Hooks)
this.metaClass.mixin(cucumber.api.groovy.EN)

def adicionarJogador(String nome, JogadorController controlador){
    def jogador = new Jogador([nome: nome, cpf: "12312312321"])
//    println("Vjogador: " + jogador)
    controlador.save(jogador)
//    controlador.response.reset()
}

def adicionarContrato(String nomeContrato, nomeAtleta, ContratoController controlador){
    def atleta = Jogador.findByNome(nomeAtleta)
    def contrato = new Contrato(valido: true, nome: nomeContrato, jogador: atleta, salario: 1230)
    controlador.save(contrato)
}

def verContrato(String nomeContrato, nomeAtleta){ //retorna se contrato tem determinado atleta
    def contrato = Contrato.findByNome(nomeContrato)
//    println("contrato nome: " +  contrato.getNome())
    return contrato.getJogador().nome == nomeAtleta
}

def desativarJogador(String nomeAtleta, JogadorController controlador){
    def atleta = Jogador.findByNome(nomeAtleta)
    controlador.desative(atleta)
}

Given(~/^o atleta "([^"]*)" está cadastrado$/) { String atleta ->
    def controlador = new JogadorController()
    adicionarJogador(atleta, controlador)
    assert Jogador.findByNome(atleta) //se não encontra atleta com nome atleta lança exceção
}
And(~/^"([^"]*)" tem o contrato "([^"]*)"$/) { String atleta, contrato ->
    def controlador = new ContratoController()
    adicionarContrato(contrato, atleta, controlador)
    assert verContrato(contrato, atleta)
}
When(~/^"([^"]*)" é desativado$/) { String atleta ->
    def controlador = new JogadorController()
    desativarJogador(atleta, controlador)
    assert !Jogador.findByNome(atleta).ativo
}

Then(~/^o contrato "([^"]*)" é inativado$/) { String nomeContrato ->
    // Write code here that turns the phrase above into concrete actions
    def contrato = Contrato.findByNome(nomeContrato)
    assert !contrato.valido
}

Given(~/^estou na página de remoção$/) { ->
    // to RemocaoPage
    // at RemocaoPage
}
And(~/^"([^"]*)" foi marcado para ser removido$/) { String atleta ->
    // at RemocaoPage
    // page.marcaAtleta(atleta)
}
When(~/^eu solicito a remoção dos marcados$/) { ->
    // at RemocaoPage
    // page.removerMarcados()
}
Then(~/^vejo uma página de confirmação da remoção de "([^"]*)"$/) { String atleta ->
    // at RemocaoConfimacaoPage
    // assert page.atletasMarcados() == atleta
}
And(~/^em seguida vejo uma página com uma nova lista sem "([^"]*)"$/) { String arg1 ->

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
