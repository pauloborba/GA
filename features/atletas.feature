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
		Given o sistema tenha o atleta com o cpf "12190871234" 
		When eu modifico os dados do atleta com o cpf "12190871234"
		Then os dados do atleta com o cpf "12190871234"estao devidamente atualizado no sistema

	Scenario: Atualizar dados de Atleta não existente 
		Given Eu tento atualizar dados do atleta  com cpf  “09934567391” que  não está cadastrado no sistema
		When eu busco os dados do atleta com o cpf “09934567391” 
		Then os dados não serão atualizados porque o atleta é inválido

	Scenario: Classificar um atleta não existente
		Given o atleta com o cpf “09912345442” não está cadastrado  no sistema 
		When eu classificar o atleta como “Júnior”
		Then a classificação não será salva no sistema porque o atleta é inválido

	Scenario: Classificar atleta de forma errada 
		Given o atleta com o cpf “09912345442” é Júnior
		And eu o classifico com Profissional
		When eu classificar o atleta
		Then a classificação não será salva no sistema porque está classificado de forma errada