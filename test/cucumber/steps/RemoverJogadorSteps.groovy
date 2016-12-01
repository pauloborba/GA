package steps

import ga.Jogador
import ga.JogadorController
import ga.Contrato
import pages.CadastrarJogador
import pages.NovoJogador
import pages.ProcurarJogador
import pages.ExcluirJogador

this.metaClass.mixin(cucumber.api.groovy.Hooks)
this.metaClass.mixin(cucumber.api.groovy.EN)


def adicionarJogador(String nome, cpf, dataDeNascimento, posicao, JogadorController controlador){
    def jogador = new Jogador(nome: nome, cpf: cpf, dataDeNascimento: Date.parse("dd/MM/yyyy", dataDeNascimento), posicao: posicao)
    controlador.salvar(jogador)
}

def adicionarContratoEmJogador(String cpf, String dinicial, String dfinal, JogadorController controlador){
    def atleta = Jogador.findByCpf(cpf)
    def contrato = new Contrato(inicial: Date.parse("dd/MM/yyyy", dinicial), termino: Date.parse("dd/MM/yyyy", dfinal))
    controlador.addContrato(cpf, contrato)
}

def procurarContratoEspecificoEmJogador(String cpf, dinicial, dfinal){ //retorna um contrato com determinadas datas, se existir
    def jogador = Jogador.findByCpf(cpf)
		def contratos = jogador.contratos.findAll()
		contratos.each { contrato->
				if ((contrato.inicial == Date.parse("dd/MM/yyyy", dinicial)) && (contrato.termino == Date.parse("dd/MM/yyyy", dfinal))) {
						return contrato
				}
		}
}

def verContratoEspecificoEmJogador(String cpf, dinicial, dfinal, boolean estado){ //retorna se um atleta tem um determinado contrato com estado indicado
		def contrato = this.procurarContratoEspecificoEmJogador(cpf, dinicial, dfinal)
		// print "_________\nC" + contrato.valido
		if (contrato && contrato.valido){
			return true
		}
		return false
}

def verContratoAtivoEmJogador(String cpf){ //diz se um jogador tem um contrato ativo
		def jogador = Jogador.findByCpf(cpf)
		resp = false
		def contratos = jogador.contratos.findAll()
		contratos.each{ contrato->
				resp = resp || contrato.valido
		}
		return resp
}

//--------------------------------------------------------
Given(~/^o atleta de nome "([^"]*)", cpf "([^"]*)", data de nascimento "([^"]*)" e posição "([^"]*)" está cadastrado$/) { String nome, cpf, dataDeNascimento, posicao ->
    def controlador = new JogadorController()
    adicionarJogador(nome, cpf, dataDeNascimento, posicao, controlador)
    assert Jogador.findByCpf(cpf)
}

And(~/^"([^"]*)" tem um contrato ativo com data inicial "([^"]*)" e data final "([^"]*)"$/) { String cpf, dinicial, dfinal->
    def controlador = new JogadorController()
    adicionarContratoEmJogador(cpf, dinicial, dfinal, controlador)
    assert verContratoEspecificoEmJogador(cpf, dinicial, dfinal, true)
}

When(~/^"([^"]*)" é desativado$/) { String cpf ->
    def controlador = new JogadorController()
    controlador.desativa(cpf)
    assert !Jogador.findByCpf(cpf).ativo
}

Then(~/^o contrato de "([^"]*)" com data inicial "([^"]*)" e data final "([^"]*)" é inativado$/) { String cpf, dinicial, dfinal ->
    assert verContratoEspecificoEmJogador(cpf, dinicial, dfinal, false)
}

When(~/^é tentado remover "([^"]*)"$/) { String cpf ->
    def controlador = new JogadorController()
    controlador.deleta(cpf)
}

Then(~/^"([^"]*)" não é removido$/) { String cpf ->
    assert Jogador.findByCpf(cpf) != null
}

And(~/^"([^"]*)" não tem contratos ativos$/){ String cpf ->
		assert !verContratoAtivoEmJogador(cpf)
}

Then(~/^"([^"]*)" é removido$/) { String cpf ->
    assert Jogador.findByCpf(cpf) == null
}


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

When(~/^eu tento excluir o atleta "([^"]*)"$/) { String atleta ->
	to ProcurarJogador
	at ProcurarJogador
	page.procurar(atleta)
	page.deletarAtleta(atleta)
}

Then(~/^eu vou para a página de confirmação de remoção de atleta$/) { ->
	at ExcluirJogador
}

And(~/^eu vejo uma mensagem de atleta excluído com sucesso$/) { ->
	assert page.jogadorExcluido()
}
