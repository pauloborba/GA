Feature: Atleta
	As a supervisor cadastrado no sistema.
	I want adicionar, remover, atualizar e classificar atletas.
	So that eu possa gerar páginas da web e relatórios contendo as informações dos atletas

	Scenario: Adicionar atleta novo
		Given o sistema não tem o atleta com o CPF “09719992836”
		When eu adiciono o atleta com o CPF “09719992836”
		Then o atleta com o CPF “09719992836” está devidamente armazenado pelo sistema

	Scenario: Adicionar Atleta novo web 
		Given estou no menu de Atletas
		When eu selecionar a opção “Adicionar” no menu de Atletas
		And eu selecionar a opção de adicionar novo atleta
		Then eu posso preencher os dados do atleta

	Scenario: Adicionar atleta inválido web (nome campo em branco) 
		Given estou na página de adicionar novo atleta
		When eu preencher todas as informações do atleta, exceto o campo nome
		And eu opto por criar o artigo
		Then uma mensagem de erro é mostrada
		
	Scenario: Adicionar atleta inválido (nome campo em branco) 
		Given o sistema não tem nenhum atleta com o CPF “09812304954”
		When eu adicionar o atleta com o CPF “09812304954” com o campo “nome” em branco
		Then o atleta com o CPF “09812304954” não é cadastrado pelo sistema porque é inválido

	Scenario: Adicionar atleta duplicado 
		Given o sistema tenha o atleta com o CPF “08976898765”
		When eu adicionar o atleta com o CPF “08976898765”
		Then o atleta com o CPF “08976898765” não é armazenado duas vezes
