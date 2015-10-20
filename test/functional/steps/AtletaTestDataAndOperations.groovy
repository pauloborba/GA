package steps

import ga.Atleta
import ga.AtletaController

/**
 * Created by ess on 02/10/15.
 */

class AtletaTestDataAndOperations {

    public static createAtleta(String cpf) {
        def controller = new AtletaController();
        controller.params << [nome: "Rafael", telefone: "9898374", email: "rrfo", cpf: cpf, rg: "87473823", altura: 1.80,
                              peso: 80, posicao: "atacante", categoria: "sub 17", alojamento: false]
        controller.request.setContent(new byte[1000])
        controller.saveAtleta(controller.createAtleta())
        controller.response.reset()
    }


}