package steps

import cucumber.api.PendingException
import ga.AtletaController
import page.*
import steps.AtletaTestAndDataOperations
import ga.Atleta
import static cucumber.api.groovy.EN.*


Given(~/^o atleta de CPF "([^"]*)" esta cadastrado no sistema$/) { String cpf ->
    assert Atleta.findByCpf(cpf) != null
}

When(~/^tento excluir o atleta de CPF "([^"]*)"$/) { String cpf ->
    def controller = new AtletaController()
    Atleta atleta = Atleta.findByCpf(cpf)
    AtletaTestAndDataOperations.removeAtleta(cpf)
}

Then(~/^O atleta de cpf "([^"]*)" e devidamente removido do sistema$/) { String cpf ->
    assert Atleta.findByCpf(cpf) == null
}

//---------------------------------------------------------//

Given(~/^eu estou na pagina de atletas$/) { ->
    to AtletasPage
    waitFor { at AtletasPage }
}

And(~/^eu visualizo a lista de todos os atletas$/) { ->
    at AtletasPage
    atletas = Atleta.findAll()
    assert atletas != null
}

When(~/^eu tento remover o atleta de CPF "([^"]*)"$/) { String cpf ->
    to DeleteAtletaPage
    at DeleteAtletaPage

    DeleteAtletaPage.fillAtletaDetails(nome,cpf,data_nascimento)
    DeleteAtletaPage.selectDeleteAtleta()
}


Then(~/^eu poderei ver uma mensagem de confirmacao na tela$/) { ->
    at DeleteAtletaPage
    def hasMessage = page.hasMessage()
    assert hasMessage != null

}


//---------------------------------------------------------//

Given(~/^o atleta de CPF "([^"]*)" nao esta cadastrado no sistema$/) { String cpf ->
    assert Atleta.findByCpf(cpf) == null
}

When(~/^eu tento excluir o atleta de CPF "([^"]*)"$/) { String cpf ->
    assert Atleta.findByCpf(cpf) == null
}

Then(~/^o sistema nao sofre nenhuma alteracao$/) { ->

}

//---------------------------------------------------------//
