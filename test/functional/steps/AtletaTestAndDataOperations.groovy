package steps

import ga.AtletaController

class AtletaTestAndDataOperations {


    static atleta = [
            [name: "Thiago Santos", cpf: "012345678912", data_nascimento: "11/11/2011", contrato:"1"]

    ]


    public static def findByCpf(String cpf){
        atleta.find{    atleta ->
                atleta.cpf == cpf
        }
    }

    public static createAtleta(String nome, String cpf , String data_nascimento, String contrato){
        def controller = new AtletaController()
        controller.params << [nome: nome, cpf: cpf, data_nascimento: data_nascimento, contrato: contrato]

        controller.request.setContent(new byte[1000])
        controller.saveAtleta(controller.criarAtleta())
        controller.response.reset()
    }

    public static void removeAtleta(def atleta){
        def controller = new AtletaController()
        controller.params << [id: atleta.getcpf()]
        controller.request.setContent(new byte[1000])
        controller.delete()
        controller.response.reset()

    }

}