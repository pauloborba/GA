package steps

import ga.Contrato
import ga.ContratoController
import ga.Jogador

class ContratoStepsData {

    // utilizado para criar um novo contrato utilizando o controller
    static def createContrato(String inicio, String termino, double salario, String cpf){
        int tamanho = Contrato.findAll().size()
        def controller = new ContratoController()
        controller.params << [txt_cpf:cpf, txt_datainicio: inicio, txt_datafinal: termino, txt_salario: salario]
        controller.novo()
        controller.response.reset()
        assert Contrato.findAll().size() == tamanho + 1
    }
}
