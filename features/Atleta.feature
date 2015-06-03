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
		When eu selecionar a opcao "Adicionar" no menu de Atletas
		And eu preencher os dados do atleta
		And o atleta nao esta armazenado no sistema
		And eu selecionar a opcao "Cadastrar"
		Then o atleta será armazenado no sistema
		And a mensagem de sucesso ira aparecer

	Scenario: Adicionar atleta invalido web (nome campo em branco) 
		Given estou na pagina de adicionar novo atleta
		When eu preencher todas as informacoes do atleta, exceto o campo nome
		And eu opto por criar o artigo
		Then uma mensagem de erro e mostrada

	Scenario: Adicionar atleta inválido (nome campo em branco) 
		Given o sistema nao tem nenhum atleta com o CPF "09812304954"
		When eu adicionar o atleta com o CPF "09812304954" com o campo "nome" em branco
		Then o atleta com o CPF "09812304954" nao e cadastrado pelo sistema porque e invalido

	Scenario: Adicionar atleta duplicado 
		Given o sistema tenha o atleta com o CPF "08976898765"
		When eu adicionar o atleta com o CPF "08976898765"
		Then o atleta com o CPF "08976898765" nao e armazenado duas vezes
