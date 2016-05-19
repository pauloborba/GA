package steps

import cucumber.api.PendingException
import gaatleta.AtletaController
import gaatleta.Atleta

Given(~'^O atleta de CPF "([^"]*)" não esta cadastrado no sistema$') { String cpf ->
    atleta = Atleta.findByCPF(cpf)
    assert atleta == null
}

When(~'^Eu adiciono o atleta de CPF"([^"]*)"$') { String cpf ->
    Atletas.addAtleta(null, cpf, null, null)
}

Then(~'^O sistema adiciona o atleta com sucesso$') { String cpf ->
    atleta = Atletas.findByCPF(cpf)
    assert atleta != null
}

Given(~'^Estou no menu de Atletas$') { ->
    at AtletasPage
}

And(~'^O atleta de CPF "([^"]*)" não esta na lista de atletas$') {String cpf->
    at AtletasPage
    assert AtletasPage.selectAtleta(cpf) == false
}

When(~'^Eu tento cadastrar o atleta "([^"]*)" com o CPF "([^"]*)"$') { String nome, cpf ->
    at AtletasPage
    AtletasPage.fillNome(nome)
    AtletasPage.fillCpf(cpf)
}

Then(~'^Eu posso ver uma mensagem de sucesso e o nome "([^"]*)" e CPF "([^"]*)"$') { String nome, cpf
    at AtletasPage
    at ConfirmationPage
    assert ConfirmationPage.selectNome(nome) == true
    assert ConfirmationPage.selectCpf(cpf) == true
}

