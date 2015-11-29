Feature: User

	As a membro de um grupo de atletas
	I want acessar o sistema de gerenciamento de atletas
	So that eu posso usar todas as funcionalidades

	Scenario: Tentando logar usando credenciais corretas web
		Given estou na pagina de login
		When eu aperto entrar apos preencher o campo de login e senha com "admin" e "senha123" respectivamente
		Then eu serei redirecionado para a pagina inicial

	Scenario: Tentando logar usando credenciais erradas web
		Given estou na pagina de login
		When eu aperto entrar apos preencher o campo de login e senha com "adnin" e "senha123" respectivamente
	    Then eu permaneco na pagina de login


	Scenario: Tentando logar usando credenciais corretas
		Given que o login "admin" esta cadastrado no sistema
		When eu tento acessar o sistema com o login "admin" e senha "senha123"
		Then eu consigo acessar o gerenciador de atletas


	Scenario: Tentando logar usando nome de usuário errado
		Given que o login "adnin" nao esta cadastrado no sistema
		When eu tento acessar o sistema com o login "adnin" e senha "senha123"
		Then eu nao consigo acessar o gerenciador de atletas
