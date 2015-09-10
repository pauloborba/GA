Feature: Controle de Acesso

	As a membro de um grupo de atletas
	I want acessar o sistema de gerenciamento de atletas
	So that eu posso usar todas as funcionalidades

	Scenario: Tentando logar usando credenciais corretas web
		Given estou na página de Login
		And eu preenchdo o campo de login e senha com "joaoluiz" e "senha123" respectivamente  
		When eu seleciono a opçao entrar
		Then eu serei redirecionado para a página inicial

	Scenario: Tentando logar usando credenciais erradas web
		Given estou na página de Login
		And eu preencho o campo de login e senha com "joaoluis" e "senha123" respectivamente
		When eu seleciono a opçao entrar      
        Then uma mensagem de erro aparece na tela
		And eu sou redirecionado para a tela de login

	Scenario: Tentando logar usando credenciais corretas
		Given que o Login "joaoluiz" e Senha "senha123" estão cadastrados no sistema
		When eu tento acessar com o login "joaoluiz" e senha "senha123"
		Then eu consigo acessar o gerenciador de atletas 

	Scenario: Tentando logar usando nome de usuário errado
		Given que o login "joaoluis" não esta cadastrado no sistema
		When Eu tento acessar o sistema com o login "joaoluis" e senha "senha123"
		Then eu não consigo acessar o gerenciador de atletas