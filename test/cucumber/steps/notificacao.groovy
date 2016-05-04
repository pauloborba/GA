Given(~'^O atleta "([^"]*)" de CPF "([^"]*)" está cadastrado no sistema$') {String nome, String cpf -> 
	createAtleta(nome,cpf)
	assert findByCpf(cpf) != null
}

When(~'^O contrato do jogador de CPF "([^"]*)" está a exato "([^"]*)" de expirar$') {->
	assert true
}

Then(~'^O sistema envia uma notificação para o email cadastrado'){->
	assert true
}

Given(~'^Estou no menu de Contratos$'){->
	to LoginPage
	at LoginPage
	page.add("admin","adminadmin")
	at ContratoPage
}

Then(~'Vejo uma mensagem de alerta$'){->
	assert (page.readFlashMessage() != null
}