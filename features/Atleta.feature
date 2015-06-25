Feature: Atleta
	As a supervisor cadastrado no sistema
	I want adicionar, remover, atualizar e classificar atletas
	So that eu possa gerar paginas da web e relatorios contendo as informacoes dos atletas

	Scenario: Adicionar atleta novo
		Given o sistema nao tem o atleta com o cpf "09719992836"  
		When eu adiciono o atleta com o cpf "09719992836"
		Then o atleta com o cpf "09719992836" esta devidamente armazenado pelo sistema

	Scenario: Adicionar Atleta novo web 
		Given estou no menu de Atletas
		When eu clico no botao "Adicionar" no menu de Atletas
		And eu preencher os dados do atleta
		And o atleta nao esta armazenado no sistema
		And eu clico no botao "Cadastrar"
		Then o atleta sera armazenado no sistema
		And a mensagem de sucesso ira aparecer "Atleta cadastrado com sucesso"

	Scenario: Adicionar atleta inválido (nome campo em branco) 
		Given o sistema nao tem nenhum atleta com o CPF "09812304954"
		When eu adicionar o atleta com o CPF "09812304954" com o campo "nome" em branco
		Then o atleta com o CPF "09812304954" nao e cadastrado pelo sistema porque e invalido

	Scenario: Adicionar atleta duplicado 
		Given o sistema tenha o atleta com o CPF "08976898765"
		When eu adicionar o atleta com o CPF "08976898765"
		Then o atleta com o CPF "08976898765" nao e armazenado duas vezes
