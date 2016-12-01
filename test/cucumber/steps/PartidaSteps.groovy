package steps

import pages.CadastrarJogador
import pages.NovoJogador
import pages.CadastrarPartida
import pages.NovaPartida
import ga.Partida
import ga.PartidaController
import ga.Jogador
import ga.JogadorController
import ga.PartidasNoMesmoDiaException

this.metaClass.mixin(cucumber.api.groovy.Hooks)
this.metaClass.mixin(cucumber.api.groovy.EN)

def preencheForm(String adversario, String data, String golsSofridos) {
	page.preenche("txt_adversario", adversario)
	page.preenche("txt_data", data)
	page.preenche("txt_gols_sofridos", golsSofridos)
}

Given(~/^eu estou na página de cadastro de partida$/) { ->
	to CadastrarPartida
	at CadastrarPartida
}

When(~/^eu cadastro uma partida para o jogo contra o "([^"]*)", no dia "([^"]*)" em que o clube sofreu "([^"]*)" gols$/) { String adversario, data, golsSofridos ->
	preencheForm(adversario, data, golsSofridos)
	page.cadastrar()
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

When(~/^eu cadastro uma partida para o jogo contra o "([^"]*)", no dia "([^"]*)" em que o clube sofreu "([^"]*)" gols com o atleta "([^"]*)" como titular$/) {  String adversario, data, golsSofridos, titular ->
	preencheForm(adversario, data, golsSofridos)
	page.marcaTitular(titular)
	page.cadastrar()
}

And(~/^eu vejo uma mensagem de confirmação de partida cadastrada com sucesso$/) { ->
	assert page.cadastroComSucesso()
}

// Controlador

// Funções

def adicaoJogo(Date data, String adversario, String golsSofridos){
    PartidaController controlador = new PartidaController()
    Partida partida = new Partida([adversario: adversario, golsSofridos: golsSofridos.toInteger(), data: data])
    try {
    	controlador.salvarPartida(partida)
    } catch(PartidasNoMesmoDiaException e) {}
}

def procuraPartida(Date data){
    if (Partida.findByData(data) != null) {
        return true
    } else {
        return false
    }
}

def remocaoPartida(Date data){
    PartidaController controlador = new PartidaController()
    Partida partida = Partida.findByData(data)
    controlador.removerPartida(partida)

}

def adicaoJogador(String nome, String cpf, Date nascimento, String posicao) {
	def j = new Jogador(nome: nome, cpf: cpf, dataDeNascimento: nascimento, posicao: posicao)
	def controlador = new JogadorController()
	controlador.salvar(j)
}
//Adicao de partida não cadastrada
Given(~/^o sistema não possua nenhuma partida no dia "([^"]*)"$/) {String data ->
    assert !procuraPartida(Date.parse("dd/MM/yyyy", data))
}

When(~/^eu crio uma partida no dia "([^"]*)", contra o "([^"]*)", em que o clube sofreu "([^"]*)" gols$/){String data, adversario, golsSofridos ->
    adicaoJogo(Date.parse("dd/MM/yyyy", data),adversario,golsSofridos)
}

Then(~/^a partida do dia "([^"]*)" é salva no sistema$/){String data ->
    assert procuraPartida(Date.parse("dd/MM/yyyy", data))
}
//Adicao de partida já cadastrada
Given(~/^o sistema possui uma partida no dia "([^"]*)"$/){ String data ->
	adicaoJogador("Romario", "123.123.123.12", new Date() - (360 * 50), "goleiro")
	def partida = new Partida(adversario: "santos", golsSofridos: 0, data: Date.parse("dd/MM/yyyy", data))
	partida.addToTitulares(Jogador.findByCpf("123.123.123.12"))
	def partidaController = new PartidaController()
	partidaController.salvarPartida(partida)
    assert procuraPartida(Date.parse("dd/MM/yyyy", data))
}

Then(~/^o sistema só armazena uma partida para o dia "([^"]*)"$/) { String data ->
	assert Partida.findAllByData(Date.parse("dd/MM/yyyy", data)).size() == 1
}

Then(~/^a partida do dia "([^"]*)" não é removida do sistema$/){String data ->
    assert !procuraPartida(Date.parse("dd/MM/yyyy", data))
}

//Remoção de partida não cadastrada
When(~/^eu removo a partida do dia "([^"]*)"$/){String data ->
    remocaoPartida(Date.parse(("dd/MM/yyyy"), data))
}

Then(~/^ a partida do dia "([^"]*)" é removida do sistema$/){String data ->
    assert !procuraPartida(Date.parse("dd/MM/yyyy", data))
}

After() {
	Partida.findAll().each { it.delete(flush: true) }
}
