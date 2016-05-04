
//Scenario: Adicionar Atleta sem sucesso

Given(~'^Um atleta de nome "([^"]*)" e CPF "([^"]*)" se encontra cadastrado no sistema$') {String nome, String cpf -> 
	createAtleta(nome,cpf)
	assert Atleta.findByCpf(cpf) != null
}

When(~'^Tento cadastrar um novo atleta "([^"]*)" com o CPF "([^"]*)"$') {String nome, String cpf -> 
	AtletaTestAndDataOperations.createAtleta(nome, cpf)
}

Then(~'^O sistema não permite o cadastro duplicado do CPF "([^"]*)"$') {String cpf ->
	atletas = Atleta.findAllByCpf(cpf)
	assert atletas.size()==1
}

//criar findByCpf, findAllByCpf, createAtleta

//web
Given(~'^Estou no menu Atletas$'){->
	to LoginPage
	at LoginPage
	page.add("admin","adminadmin")
	at AtletasPage
}

When(~'^Seleciono a opção Adicionar Atleta$'){->
	to AtletasPage
    page.selectNewAtleta()
}

Then(~'Vejo uma mensagem erro$'){->
	assert (page.readFlashMessage() != null
}

//criar AtletasPage

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

Given(~'^O atleta de CPF "([^"]*)" não esta cadastrado no sistema$') { String cpf ->
    atleta = Atletas.findByCPF(cpf)
    assert atleta == null
}

When(~'^Eu adiciono o atleta de CPF"([^"]*)"$') { String cpf ->
    Atletas.addAtleta(null, cpf, null, null)
}

Then(~'^O sistema adiciona o atleta com sucesso$') { String cpf ->
    atleta = Atletas.findByCPF(cpf)
    assert atleta != null
}
