Feature: Controle de Acesso.

	As a member of an Athletic Group.
	I want to acess the Athletic management system
	So that i can use all system functions

	Scenario: Tentando logar usando credenciais corretas.
		Given: Estou na página de Login.
		When: Eu tento logar com credenciais corretas.
		Then: Eu serei redirecionado para a página inicial.

	Scenario: Tentando logar usando credenciais erradas.
		Given: Estou na página de Login.
		when: Eu tento logar com credenciais erradas.
		Then: Uma mensagem de erro aparece na tela.
		and: Eu sou redirecionado para a tela de login.

	Scenario: Tentando logar usando credenciais corretas.
		Given: Eu tento logar
		When: Os campos de "login" e senha estão preenchidos
		Then: O sistema verifica "Login" e "Senha"
		And: Os dados estão cadastradas no sistema
		And: Eu entro no Sistema

	Scenario: Tentando logar usando nome de usuário errado.
		Given: Eu tento logar
		When: O campo de login está preenchido errado
		Then: O sistema verifica o "login"
		And: O usuário não está cadastrado no
		And: Eu sou redirecionado pra pagina de login