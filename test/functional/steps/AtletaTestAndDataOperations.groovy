package steps

import ga.Atleta
import ga.AtletaController

class AtletaTestAndDataOperations {


    static atleta = [ ]



    public static def findByCpf(String cpf){
         atleta.find{
            atleta ->  atleta.cpf == cpf
        }
    }

    public static createAtleta(String nome, String cpf , String data_nascimento){
        def controller = new AtletaController()
        controller.params << [nome: nome, cpf: cpf, data_nascimento: data_nascimento]
        controller.request.setContent(new byte[1000])
        controller.save()
        controller.response.reset()
    }

    public static void removeAtleta(String cpf){
        def controller = new AtletaController()
        Atleta atl = Atleta.findByCpf(cpf)
        controller.params << [id: atl.cpf]
        controller.request.setContent(new byte[1000])
        controller.delete(atl)
        controller.response.reset()

    }

}