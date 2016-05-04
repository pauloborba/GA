
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
