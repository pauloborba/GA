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
    contratos = Contrato.findAll()
    assert contratos != null
}
When(~/^eu tento adicionar um contrato com contratante "(.*?)",contratado "(.*?)", data de início "(.*?)" ,data de termino "(.*?)", valor "(.*?)"$/) { String contratante, String contratado, String data_inicio, String data_termino, String valor ->
    to CreateContratoPage
    at CreateContratoPage

    page.fillContratoDetails(contratante,contratado,data_inicio,data_termino,valor)
    page.selectCreateContrato()
}

Then(~/^poderei ver o contrato salvo na lista de contratos$/) { ->
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
    contratt = contratante
    contratd = contratado
    inicio = data_inicio
    fim = data_fim


}
Then(~/^o contrato nao sera salvo no sistema pois o contrato já existe$/) { ->
    assert contratt != null && !salvo
    assert contratd !=null && !salvo
    assert inicio !=null && !salvo
    assert fim !=null && !salvo
}

Given(~'^o contrato aparece na lista de contratos cadastrados$') { ->
    at ContratoPage
}
When(~/^preencho os detalhes com contratante "([^"]*)", contratado "([^"]*)" com data de inicio "([^"]*)" e data de termino "([^"]*)",valor "([^"]*)"$/) { String contratante, String contratado, String inicio, String termino, String valor ->
    at CreateContratoPage
    page.fillContratoDetails(contratante,contratado,inicio,termino,valor)
}
When(~/^seleciono a opção Create$/) { ->
    page.selectCreateContrato()
}


Then(~'^aparecera uma mensagem de erro na tela$') { ->

    at CreateContratoPage
    def hashMessage = page.hasMessage()
    assert hashMessage !=null

    }



