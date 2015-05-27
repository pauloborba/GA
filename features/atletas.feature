Feature: Atleta
	As a supervisor cadastrado no sistema.
	I want adicionar, remover, atualizar e classificar atletas.
	So that eu possa gerar paginas da web e relatorios contendo as informacoes dos atletas
	
	Scenario: Atualizar dados web de atleta existente 
		Given eu estou na pagina de atualizacao de atleta
		And o atleta com o cpf "12190871234" esta cadastrado no sistema
		And eu mudo os dados do atleta com o cpf "12190871234"
		And eu seleciono a opcao "Atualizar"
		Then ira aparecer uma mensagem de confirmacao na tela
	
	Scenario: Atualizar dados de atleta existente 
		Given o sistema tenha o atleta com o cpf "12190871234" 
		When eu modifico os dados do atleta com o cpf "12190871234"
		Then os dados do atleta com o cpf "12190871234"estao devidamente atualizado no sistema

	