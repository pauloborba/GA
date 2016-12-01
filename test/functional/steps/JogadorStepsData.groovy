package steps

import ga.Contrato
import ga.ContratoController
import ga.Jogador
import ga.JogadorController
import ga.Notificacao
import ga.Usuario
import ga.UsuarioController

class JogadorStepsData {

    // utilizado para criar um novo jogador utilizando o controller
    static def createJogador(String nome, String cpf, String posicao, String dataDeNascimento){
        def controller = new JogadorController()
        controller.params << [txt_cpf:cpf, txt_atleta:nome, select_posicao:posicao, txt_nascimento: dataDeNascimento]
        controller.novo()
        controller.response.reset()
        assert Jogador.findByCpf(cpf) != null
    }
}
