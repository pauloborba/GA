import TestarDadosEOperacoes

Given (~'^O sistema tem um atleta com o CPF "([^"]*)" e o nome "([^"]*)" $'){
	String cpf, nome -> TestarDadosEOperacoes.criarAtleta(nome, cpf)
	atleta = atleta.findByCPF(cpf)
	assert atleta != null

}

When(~'^ Eu excluo o atleta de CPF ([^"]*)" $'){
	String cpf -> TestarDadosEOperacoes.removeAtleta(cpf)
}

Then(~'^ O atleta de cpf ([^"]*)" é devidamente removido do sistema $'){
	String cpf -> atleta = atleta.findByCPF(cpf)
	assert atleta = null
}



Given (~'^o atleta de CPF "([^"]*)" está cadastrado no sistema$') {
	String usercpf -> TestarDadosEOperacoes.criarAtleta(usercpf)
	cpf = Cpf.findByCPF(cpf);
	assert cpf != null
}

When(~'^ tento excluir o atleta de CPF "([^"]*)" $') {
	String usercpf -> TestarDadosEOperacoes.excluirAtleta(usercpf)
}

Then(~'^O sistema remove o atleta "([^"]*)" com sucesso$') {
	String usercpf -> cpf = Cpf.find](cpf)
	assert cpf == null
}
