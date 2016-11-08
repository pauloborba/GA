package steps

import cucumber.api.PendingException
import ga.Contrato
import ga.ContratoController
import ga.Jogador
import ga.JogadorController

this.metaClass.mixin(cucumber.api.groovy.Hooks)
this.metaClass.mixin(cucumber.api.groovy.EN)

def adicionarJogador(String nome, String cpf, String posicao, Date nascimento, JogadorController controlador) {
    def jogador = new Jogador([nome: nome, cpf: cpf, dataDeNascimento: nascimento, posicao: posicao])
    controlador.save(jogador)
    controlador.response.reset()
}

def adicionarContrato(Jogador jogador, Date inicial, Date termino, double salario, boolean valido, ContratoController controlador) {
    def contrato = new Contrato([inicial: inicial, termino: termino, salario: salario, valido: true])
    jogador.addContrato(contrato, controlador)
}

Given(~/^o atleta "([^"]*)" de CPF "([^"]*)" está cadastrado no sistema$/) { String atleta, String cpf ->
    def controlador = new JogadorController()
    adicionarJogador(atleta, cpf, "atacante", Date.parse("dd/MM/yyyy", "01/01/2000"), controlador)
    assert Jogador.findByCpf(cpf) != null
}

numeroDeContratos = 0;

And(~/^o atleta "([^"]*)" de CPF "([^"]*)" já tem um contrato vigente$/) { String atleta, String cpf ->
    def jogador = Jogador.findByCpf(cpf)
    def controlador = new ContratoController()
    adicionarContrato(jogador, new Date(), new Date() + 2, 10000.00, true, controlador)
    boolean contratoativo = false
    jogador.contratos.each { it ->
        contratoativo = contratoativo || ( (new Date() <= it.termino) && (it.valido) )
    }
    numeroDeContratos = Contrato.findAll().size()
    assert contratoativo
}

When(~/^eu tento cadastrar um novo contrato para o atleta "([^"]*)" de CPF "([^"]*)"$/) { String atleta, String cpf ->
    def jogador = Jogador.findByCpf(cpf)
    def controlador = new ContratoController()
    adicionarContrato(jogador, new Date(), new Date() + 2, 10000.00, true, controlador)
}

Then(~/^a aplicação não altera o estado$/) { ->
    assert Contrato.findAll().size() == numeroDeContratos
}


Given(~/^eu estou na página de cadastro de novo contrato$/) { ->
}
When(~/^eu cadastro um contrato para o atleta "([^"]*)"$/) { String arg1 ->
}
Then(~/^eu vejo uma mensagem de sucesso confirmando o novo contrato$/) { ->
}