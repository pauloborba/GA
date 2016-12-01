package steps

import cucumber.api.groovy.EN
import cucumber.api.groovy.Hooks
import pages.CadastrarJogador
import pages.NovoJogador
import pages.CadastrarPartida
import pages.NovaPartida
import ga.Partida
import ga.PartidaController
import ga.Jogador
import ga.JogadorController

this.metaClass.mixin(Hooks)
this.metaClass.mixin(EN)

Given(~/^eu estou na página de cadastro de partida$/) { ->
	to CadastrarPartida
	at CadastrarPartida
}

When(~/^eu preencho o formulário de partida para o jogo contra o "([^"]*)", no dia "([^"]*)" em que o clube sofreu "([^"]*)" gols$/) { String adversario, data, golsSofridos ->
	page.preenche("txt_adversario", adversario)
	page.preenche("txt_data", data)
	page.preenche("txt_gols_sofridos", golsSofridos)
}

And(~/^eu clico no botão "cadastrar"$/) { ->
	page.cadastrar()
}

Then(~/^eu vou para a página de confirmação de cadastro de partida$/) { ->
	at NovaPartida
}

And(~/^eu vejo uma mensagem de erro informando que pelo menos 1 jogador deveria ter sido escalado$/) { ->
	assert page.minimoEscalados()
}

//--2

Given(~/^o atleta "([^"]*)" de CPF "([^"]*)", data de nascimento "([^"]*)" e posição "([^"]*)" está cadastrado no sistema$/) { String atleta, cpf, nascimento, posicao ->
	to CadastrarJogador
	at CadastrarJogador
	page.preenche("txt_atleta", atleta)
	page.preenche("txt_cpf", cpf)
	page.preenche("txt_nascimento", nascimento)
	page.seleciona("select_posicao", posicao)
	page.cadastrar()
	at NovoJogador
	assert page.cadastroOk()
}

And(~/^eu marco o jogador "([^"]*)" como titular$/) { String atleta ->
	page.marcaTitular(atleta)
}

And(~/^eu vejo uma mensagem de confirmação de partida cadastrada com sucesso$/) { ->
	assert page.cadastroComSucesso()
}

// Controlador



def procuraPartida(Date data){
    if(Partida.findByData(data) != null){
        return true
    } else {
        return false
    }
}

def criarPartida (Date data, String adversario, int golsSofridos){
    def controlador = new PartidaController()
    Partida partida = new Partida([adversario: adversario, data: data, golsSofridos: golsSofridos])
    controlador.salvarPartida(partida)

}

def converterData(String data){
    return Date.parse("dd/MM/yyyy", data)
}

Given(~/^que o sistema não possua nenhuma partida no dia "([^"]*)"$/){String data ->
    assert !procuraPartida(Date.parse("dd/MM/yyyy", data))
}

When(~/^ eu crio uma partida no dia "([^"]*)", contra o "([^"]*)", em que o clube sofreu "([^"]*)" gol $/){String data, adversario, golsSofridos ->
    JogadorController controlador = new JogadorController()
    Jogador jogador = new Jogador([nome: "Jõao", cpf: "125.456.321-21", posicao: "atacante", dataDeNascimento: converterData("01/05/1984")])
    controlador.salvar(jogador)
    assert Jogador.findByCpf("125.456.321-21")
    criarPartida(converterData(data), adversario, golsSofridos)
    assert procuraPartida(Da)
}

After() {
	Partida.findAll().each { it.delete(flush: true) }
}