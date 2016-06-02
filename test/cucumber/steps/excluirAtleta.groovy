/**
 * Created by ess on 17/05/16.
 */

import steps.AtletaTestAndDataOperations

import static cucumber.api.groovy.EN.Given

Given (~'^O sistema tem um atleta com o CPF "([^"]*)" e o nome "([^"]*)" $'){
    String cpf, nome -> AtletaTestAndDataOperations.createAtleta(nome, cpf)
        atleta = atleta.findByCPF(cpf)
        assert atleta != null

}

When(~'^ Eu excluo o atleta de CPF "([^"]*)" $'){
    String cpf -> AtletaTestAndDataOperations.removeAtleta(cpf)
}

Then(~'^ O atleta de cpf ([^"]*)" é devidamente removido do sistema $'){
    String cpf -> atleta = atleta.findByCpf(cpf)
        assert atleta == null
}



Given (~'^o atleta de CPF "([^"]*)" está cadastrado no sistema$') {
    String usercpf -> AtletaTestAndDataOperations.createAtleta(usercpf)
        cpf = Cpf.findByCpf(cpf);
        assert cpf != null
}

When(~'^ tento excluir o atleta de CPF "([^"]*)" $') {
    String usercpf -> AtletaTestAndDataOperations.removeAtleta(usercpf)
}

Then(~'^O sistema remove o atleta "([^"]*)" com sucesso$') {
    String usercpf -> cpf = cpf.findByCpf(cpf)
        assert cpf == null
}