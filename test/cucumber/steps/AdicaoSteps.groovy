 
package steps

import ga.Jogador
import ga.JogadorController

this.metaClass.mixin(cucumber.api.groovy.Hooks)
this.metaClass.mixin(cucumber.api.groovy.EN)


def adicionarJogador(String CPF,String NOME , JogadorController controlador){
    def jogador = new Jogador([nome: NOME, cpf: CPF])
    controlador.save(jogador)
}


def adicionarJogadorg(String CPF,String NOME ,int gols , JogadorController controlador){
    def jogador = new Jogador([nome: NOME, cpf: CPF , golsFeitos: gols])
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

Given(~/^O sistema está esperando uma ação do usuário$/){ ->
        
}

When(~/^Tenta inserir um jogador com nome "(.*?)" , CPF "(.*?)" , golsfeitos “(-\d+)”$/) { String arg1, String arg2, int arg3 ->
    def controlador = new JogadorController()
    adicionarJogadorg(arg2, arg1, arg3 ,controlador)
    assert arg3 < 0
}



Then(~/^Jogador com CPF “(\d{11})" não é inserido$/) { long CPF ->
    SCPF = String.valueOf(CPF)
    assert !Jogador.findByCpf(SCPF);
}


Given(~/^Estou na tela de listagem de jogadores$/) { ->
    // Write code here that turns the phrase above into concrete actions

}
When(~/^Vou para o menu de cadastrar jogadores$/) { ->
    // Write code here that turns the phrase above into concrete actions

}
When(~/^preencho os campos CPF e Nome$/) { ->
    // Write code here that turns the phrase above into concrete actions

}
When(~/^Então confirmo a criação$/) { ->
    // Write code here that turns the phrase above into concrete actions

}
Then(~/^Vou para o menu de confirmação de criação de jogador$/) { ->
    // Write code here that turns the phrase above into concrete actions

}
Given(~/^Estou na tela Show jogador de um jogador com nome "(.*?)" e CPF "(.*?)"$/) { String arg1, String arg2 ->
    // Write code here that turns the phrase above into concrete actions

}
When(~/^Tento remover o jogador "(.*?)"$/) { String arg1 ->
    // Write code here that turns the phrase above into concrete actions

}
When(~/^Confirmo que desejo remover$/) { ->
    // Write code here that turns the phrase above into concrete actions

}
Then(~/^Não visualizo o nome do jogador "(.*?)" na pagina de listagem de jogador$/) { String arg1 ->
    // Write code here that turns the phrase above into concrete actions
    
}
