 
package steps

import ga.Jogador
import ga.JogadorController
import ga.Partida
import pages.CadastrarJogador
import pages.NovoJogador

this.metaClass.mixin(cucumber.api.groovy.Hooks)
this.metaClass.mixin(cucumber.api.groovy.EN)


def adicionarAtleta(String nome, String cpf, Date nascimento, String posicao) {
    def controlador = new JogadorController()
    def jogador = new Jogador([nome: nome, cpf: cpf, dataDeNascimento: nascimento, posicao: posicao])
    controlador.salvar(jogador)
}

Given(~/^o Jogador com CPF "([^"]*)" e com nome "([^"]*)" Já está cadastrado$/) { String cpf, nome ->
    adicionarAtleta(nome, cpf, (new Date()) - 1, "atacante")
    assert Jogador.findByCpf(cpf)
}

When(~/^tentar inserir um jogador com CPF "([^"]*)" e com nome "([^"]*)" na lista de jogadores$/) { String cpf, nome ->
    adicionarAtleta(nome, cpf, (new Date()) - 1, "atacante")
}

Then(~/^o Jogador não é inserido$/) { ->
    assert Jogador.findAll().size() == 1 //somente o primeiro foi cadastrado
}

And(~/^o jogador "([^"]*)" existente continua na lista$/) { String atleta ->
    assert Jogador.findByNome(atleta)
}

Given(~/^não existe jogador com o CPF "([^"]*)" salvo$/){ String cpf ->
    assert !Jogador.findByCpf(cpf)
}
When (~/^tento inserir um jogador com CPF "([^"]*)" e nome "([^"]*)"$/){ String cpf,nome ->
    adicionarAtleta(nome, cpf, (new Date()) - 1, "atacante")
}

Then(~/^o jogador de CPF "([^"]*)" é salvo com sucesso$/){String cpf ->
    assert Jogador.findByCpf(cpf)
}


Given(~/^eu estou na página de cadastro de atletas$/) {->
    to CadastrarJogador
    at CadastrarJogador
}

When(~/^eu preencho o formulário para o atleta "([^"]*)" de CPF "([^"]*)", data de nascimento "([^"]*)" e posição "([^"]*)"$/) {String atleta, cpf, nascimento, posicao ->
    page.preenche("txt_atleta", atleta)
    page.preenche("txt_cpf", cpf)
    page.preenche("txt_nascimento", nascimento)
    page.seleciona("select_posicao", posicao)
}

And(~/^eu submeto o formulário de cadastro de jogador$/) {->
    page.cadastrar()
}

Then(~/^eu vou para a página de confirmação de cadastro de jogador$/) {->
    at NovoJogador
}

And(~/^eu vejo a mensagem "cadastrado com sucesso"$/) { -> //por conta da internacionalização a mensagem pode variar, sendo inutil capturar
    assert page.cadastroOk()
}


def cadastroAtleta(String nome, String cpf, Date nascimento, String posicao) {
    to CadastrarJogador
    page.preenche("txt_atleta", nome)
    page.preenche("txt_cpf", cpf)
    page.preenche("txt_nascimento", nascimento.format("dd/MM/yyyy"))
    page.seleciona("select_posicao", "atacante")
    page.cadastrar()
}

Given(~/^o atleta "([^"]*)" de CPF "([^"]*)" já está cadastrado$/) { String atleta, cpf ->
    cadastroAtleta(atleta, cpf, new Date() - 1, "atacante")
}

When(~/^eu tento cadastrar o atleta de nome "([^"]*)", CPF "([^"]*)"$/) { String atleta, cpf ->
    cadastroAtleta(atleta, cpf, new Date() - 1, "atacante")
}

Then(~/^eu vejo uma mensagem de erro indicando que o CPF já cadastrado$/) { ->
    assert page.cpfJaCadastrado()
}

After() {
    Partida.findAll().each { it.delete(flush: true) } //garante que nenhuma partida referencia o jogador
    Jogador.findAll().each { it.delete(flush: true) }
}
