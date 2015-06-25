Feature: Atleta
	As a supervisor cadastrado no sistema.
	I want adicionar, remover, atualizar e classificar atletas.
	So that eu possa gerar páginas da web e relatórios contendo as informações dos atletas

	Scenario: Atualizar dados web de um Atleta que não está no sistema 
		Given eu estou na página de atualização de atleta
		And  o atleta com o cpf “09934567391” não está cadastrado no sistema
		When eu busco os dados do atleta
		Then aparecerá uma mensagem de erro na tela

	Scenario: Atualizar dados web de atleta existente 
		Given eu estou na página de atualização de atleta
		And o atleta com o cpf "12190871234" está cadastrado no sistema
		And eu vizualizo os dados do atleta com o cpf "12190871234"
		When eu mudo o peso do atleta  com o cpf "12190871234" de "65kg" para "69kg"
		And eu seleciono a opção "Atualizar"
		Then irá aparecer uma mensagem de confirmacao na tela

	Scenario: Atualizar dados de atleta existente 
		Given o sistema tem o atleta com o cpf “12190871234” 
		And  o peso do atleta não está atualizado
		When eu mudo o peso do atleta com cpf “12190871234” de "65kg" para "70kg"
		Then o peso do atleta com cpf “12190871234” está devidamente atualizado no sistema

	Scenario: Atualizar dados de Atleta não existente 
		Given eu estou na pagina de atualizacao e atleta
		And o atleta com o cpf “09934567391” não está cadastrado no sistema
		When eu mudo o peso do atleta com o cpf “09934567391” de "70kg" para "72kg"
		Then o peso do atleta não será atualizados porque o atleta é inválido
