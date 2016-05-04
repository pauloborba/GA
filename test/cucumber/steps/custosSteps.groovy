//Scenario: Jogos como Titular

Given(~'^O contrato do jogador “([^"]*)” está ativo$') { String nome ->
    assert Atletas.findByNome(nome).contratoAtivo == true
}

And(~'^E “([^"]*)” tem “([^"]*)” jogos como titular$') { String nome, int jogos ->
    assert Atletas.findByNome(nome).jogos != null
}

When(~'^“([^"]*)” é escalado como titular$') { String nome ->
    Partida.escalaTitular(Atletas.findByNome(nome).cpf)
}

Then(~'^O Sistema altera o número de jogos como titular de “([^"]*)” para “([^"]*)”$') { String nome, int jogos ->
    Atletas.findByNome(nome).jogos++
}

//Scenario: Modificar acréscimo de salário


Given(~'^Estou no menu de atletas$') { ->
    at AtletasPage
}

And(~'^O acréscimo de salário para “([^"]*)” seja de “([^"]*)”$') { String nome, int salario ->
    at AtletasPage
    Atletas.findByNome(nome).acrescimoSalario != null
}

When(~'^Eu tento modificar o acréscimo de salário de "([^"]*)" para “([^"]*)”$') { String nome, int salario ->
    at AtletasPage
    Atletas.findByNome(nome).setSalario(salario)
}

Then(~'^O acréscimo de salário é atualizado com sucesso$') {
    at AtletasPage
}

//Scenario: Modificar acréscimo de salário sem sucesso

Given(~'^Estou no menu de atletas$') { ->
    at AtletasPage
}

And(~'^O acréscimo de salário para “([^"]*)” seja de “([^"]*)”$') { String nome, int salario ->
    at AtletasPage
    Atletas.findByNome(nome).acrescimoSalario != null
}

When(~'^Eu tento modificar o acréscimo de salário de "([^"]*)" para “([^"]*)”$') { String nome, int salario ->
    at AtletasPage
    assert salario <= 0
}

Then(~'^Recebo uma mensagem de erro$') {
    at AtletasPage
    flash.message("Acréscimo de salário inválido")
}

//Scenario: Modificar cota de jogos

Given(~'^Estou no menu de atletas$') { ->
    at AtletasPage
}

And(~'^A cota de jogos como titular de “([^"]*)” seja “([^"]*)”$') { String nome, int jogos ->
    at AtletasPage
    assert Atletas.findByNome(nome).cotaJogos != null
}

When(~'^Eu tento modificar a cota de jogos como titular de "([^"]*)" para “([^"]*)”$') { String nome, int jogos ->
    at AtletasPage
    Atletas.findByNome(nome).setJogos(jogos)
}

Then(~'^A cota de jogos é atualizada com sucesso$') {
    at AtletasPage
}

//Scenario: Modificar cota de jogos sem sucesso

Given(~'^Estou no menu de atletas$') { ->
    at AtletasPage
}

And(~'^A cota de jogos como titular de “([^"]*)” seja “([^"]*)”$') { String nome, int jogos ->
    at AtletasPage
    assert Atletas.findByNome(nome).cotaJogos != null
}

When(~'^Eu tento modificar a cota de jogos como titular de "([^"]*)" para “([^"]*)”$') { String nome, int jogos ->
    at AtletasPage
    assert jogos <= 0
}

Then(~'^Recebo uma mensagem de erro$') {
    at AtletasPage
    flash.message("Cota de jogos inválida")
}
