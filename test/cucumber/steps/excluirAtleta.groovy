package steps

import ga.AtletaController
import steps.AtletaTestAndDataOperations
import ga.Atleta
import static cucumber.api.groovy.EN.*

Given (~'^O sistema tem um atleta com o CPF "([^"]*)"  e nome "([^"]*)" $') {
    String cpf, nome ->
        def controlador = new AtletaController()
        def data = "01/02/1991"
        createAtleta(cpf, nome, data, controlador)

        def atleta = AtletaTestAndDataOperations.findByCpf(cpf)
        assert atleta != null
}

When(~'^ Eu excluo o atleta de CPF "([^"]*)" $'){
    String cpf -> AtletaTestAndDataOperations.removeAtleta(cpf)
}

Then(~'^ O atleta de cpf "([^"]*)" eh devidamente removido do sistema $'){
    String cpf -> atleta = AtletaTestAndDataOperations.findByCpf(cpf)
        assert atleta == null
}



def createAtleta(String cpf, String nome, String data, AtletaController controlador) {
    controlador.params << [cpf: cpf, nome: nome, dataNascimento: data ]
    controlador.save()
    controlador.response.reset()
    // eddy tromba
}





Given (~'^o atleta de CPF "([^"]*)" estah cadastrado no sistema$') {
    String usercpf -> AtletaTestAndDataOperations.createAtleta(usercpf)
        cpf =  AtletaTestAndDataOperations.findByCpf(usercpf);
        assert cpf != null
}

When(~'^ tento excluir o atleta de CPF "([^"]*)" $') {
    String usercpf -> AtletaTestAndDataOperations.removeAtleta(usercpf)
}

Then(~'^O sistema remove o atleta "([^"]*)" com sucesso$') {
    String usercpf ->
        cpf = AtletaTestAndDataOperations.findByCpf(usercpf)
        assert usercpf == null
}