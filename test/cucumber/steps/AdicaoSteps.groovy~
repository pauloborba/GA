 
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



