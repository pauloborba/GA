package steps

import ga.Atleta
import ga.AtletaController

/**
 * Created by ess on 02/10/15.
 */

class AtletaTestDataAndOperations {

    static  atlets = [

            [nome: "lucas",
             telefone: "8986712",
             email: "lucazartu@gmail.com",
             cpf: "11281727371",
             rg: "9030730",
             altura: 1.92,
             peso: 72,
             posicao:"meia",
             categoria: "asd",
             alojamento: true,
             ]
    ]

    public static createAtleta(String cpf) {
        def controller = new AtletaController();
        controller.params << [nome: "lucas", telefone: "8986712", email: "ghrm", cpf: cpf, rg: "898763", altura: 1.80,
                              peso: 80, posicao: "goleiro", categoria: "sub 17", alojamentoClube: true]
        controller.request.setContent(new byte[1000])
        controller.saveAtleta(controller.createAtleta())
        controller.response.reset()
    }

    static public void editAtletaCpf(String cpf, def Atleta){
            def controller = new AtletaController()
            controller.params << [nome: "lucas"] << [email: "lucazartu@gmail.com"] <<
                    [telefone: "91023120398"] << [cpf: cpf] << [rg: "9030730"]  << [Altura:1.92] <<
                    [Peso: 72] << [Posicao:"meia"] << [Categoria: "asd"] << [Alojamento: true] <<[id: Atleta.getId()]
            controller.edit()
            controller.saveAtleta(controller.createAtleta())
            controller.response.reset()
    }

    static public def findAtletaByCpf(String cpf) {
        atlets.find { atleta ->
            atleta.cpf == cpf
        }
    }

    static public def getAtleta(){
        return findAtletaByCpf("11281727371")
    }
}