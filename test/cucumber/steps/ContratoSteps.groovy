package steps
import ga.Contrato
import pages.ContratoPage
import pages.CreateContratoPage
import static cucumber.api.groovy.EN.*

this.metaClass.mixin(cucumber.api.groovy.Hooks)
this.metaClass.mixin(cucumber.api.groovy.EN)


Given(~'^nao existe o contrato com contratante "([^"]*)" e o contratado "([^"]*)" com data de inicio "([^"]*)" e data de termino "([^"]*)"$')
        { String contratante, String contratado, String data_inicio, String data_termino ->
        assert Contrato.findByContratante(contratante) == null
        assert Contrato.findByContratado(contratado) == null
        assert Contrato.findByData_inicio(data_inicio) == null
        assert Contrato.findByData_termino(data_termino) == null

}

When(~'^eu crio um novo contrato com o contratante "([^"]*)" e o contratado "([^"]*)" com data de inicio "([^"]*)" e data de termino "([^"]*)"$')
        { String contratante, String contratado, String data_inicio, String data_termino ->
        contratt = contratante
        contratd = contratado
        dt_inicio = data_inicio
        dt_termino = data_termino
        ContratoTestDataAndOperations.createContrato(contratante,contratado,data_inicio,data_termino)

}

Then (~'o contrato sera salvo no sistema$'){ ->
    assert Contrato.findByContratante(contratt) != null
    assert Contrato.findByContratado(contratd) != null
    assert Contrato.findByData_termino(dt_termino) !=null
    assert Contrato.findByData_inicio(dt_inicio) != null
}


Given(~'^eu estou na pagina de Contrato$') { ->
     to ContratoPage
     at ContratoPage

}
Given(~'eu visualizo a lista de todos os contratos$') { ->

    at ContratoPage
}

When(~'^eu seleciono a opção New Contrato$') { ->
    to CreateContratoPage
    at CreateContratoPage
}

When(~'^preencho os detalhes com contratante "([^"]*)",contratado "([^"]*)", data de início "([^"]*)" ,data de termino "([^"]*)", valor "([^"]*)"$')
        { String contratante, String contratado, String data_inicio, String data_termino, String valor ->

            at CreateContratoPage
            page.fillContratoDetails(contratante,contratado,data_inicio,data_termino,valor)


}
When(~'^eu seleciono a opção Create$') { ->
    page.selectCreateContrato()
}
Then(~'^poderei ver os detalhes do contrato salvos no sistema$') { ->
    to ContratoPage
    at ContratoPage
}

Given(~'^existe o contrato com contratante "([^"]*)" e o contratado "([^"]*)" com data de inicio "([^"]*)" e data de termino "([^"]*)"$') {
    String contratante, String contratado, String inicio, String fim  ->
     ContratoTestDataAndOperations.createContrato(contratante,contratado,inicio,fim)
    assert Contrato.findByContratado(contratado) != null
    assert Contrato.findByContratante(contratante) !=null
    assert Contrato.findByData_termino(fim) != null
    assert Contrato.findByData_inicio(inicio) !=null

}
When(~'^eu adicionar o contrato com o contratante "([^"]*)" e o contratado "([^"]*)" com data de inicio "([^"]*)" e data de termino "([^"]*)"$') { String contratante, String contratado, String data_inicio, String data_fim ->
   salvo = ContratoTestDataAndOperations.createContrato(contratante,contratado,data_inicio,data_fim)

}

Then(~/^o contrato nao sera salvo no sistema pois ja existe um contrato valido com o contratante "(.*?)" e contratado "(.*?)"com data de inicio "(.*?)" e data de termino "(.*?)"$/) { String arg1, String arg2, String arg3, String arg4 ->

    assert Contrato.findByContratante(arg1) !=null && !salvo
    assert Contrato.findByContratado(arg2) != null &&  !salvo
    assert Contrato.findByData_inicio(arg3) !=null && !salvo
    assert Contrato.findByData_termino(arg4) !=null && !salvo
}



