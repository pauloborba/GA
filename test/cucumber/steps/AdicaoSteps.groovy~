 
package steps

import ga.Jogador
import ga.JogadorController

this.metaClass.mixin(cucumber.api.groovy.Hooks)
this.metaClass.mixin(cucumber.api.groovy.EN)


def adicionarJogador(String CPF,String NOME , JogadorController controlador){
    def jogador = new Jogador([nome: NOME, cpf: CPF])
    controlador.save(jogador)
}

  
  

Given(~/^O Jogador com CPF “(\d{11})” e com nome "([^"]*)" Já está cadastrado$/){ long CPF , String nome ->
    SCPF = String.valueOf(CPF)
    def controlador = new JogadorController()
    adicionarJogador(SCPF, nome, controlador)
    assert Jogador.findByCpf(SCPF);

}

When(~/^Tentar inserir um jogador com CPF “(\d{11})” e com nome "([^"]*)" na lista de jogadores$/) { long CPF , String nome ->
    SCPF = String.valueOf(CPF)
    def controlador = new JogadorController()
    adicionarJogador(SCPF,nome ,controlador)
}


Then(~/^O Jogador “(\d{11})” , "([^"]*)" não será inserido$/) { long CPF , String nome ->
    assert !Jogador.findByNome(nome)
    
}

Then(~/^O jogador "([^"]*)" existente continua na lista$/) { String nome ->
    assert Jogador.findByNome(nome)
}



