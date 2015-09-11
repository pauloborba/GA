Feature: Contrato 
	
	As a usuario do sistema
	I want adicionar e cancelar contrato
	So that eu posso gerenciar os contratos dos atletas de um clube

	Scenario: adicionar novo contrato 
		Given nao existe o contrato com contratante "Nautico" e o contratado "Gabriel" com data de inicio "21/01/2015" e data de termino "21/01/2016"
		When eu crio um novo contrato com o contratante "Nautico" e o contratado "Gabriel" com data de inicio "21/01/2015" e data de termino "21/01/2016"
		Then o contrato sera salvo no sistema 

	Scenario: adicionar novo contrato web
		Given eu estou na pagina de Contrato
		And eu visualizo a lista de todos os contratos 
		When eu seleciono a opção "Novo Contrato"
		And preencho os detalhes com contratante "Nautico",contratado "Gabriel", data de início "21/01/2015" ,data de termino "21/01/2016", valor "1200"
		And eu seleciono a opção "Cadastrar"
		Then poderei ver os detalhes do contrato salvos no sistema

	Scenario: adicionar novo contrato com data de termino antes do prazo acabar  
		Given existe o contrato com contratante "Nautico" e o contratado "Gabriel" com data de inicio "21/01/2015" e data de termino "21/01/2016"
		When eu crio um novo contrato com o contratante "Nautico" e o contratado "Gabriel" com data de inicio "10/01/2016" e data de termino "10/01/2017"
		Then o contrato nao sera salvo no sistema pois ja existe um contrato valido com o contratante "Nautico" e contratado "Gabriel"

	Scenario: adicionar novo contrato com data de termino antes do prazo acabar web
		Given eu estou na pagina de Contrato
		And  o contrato com o contratante "Nautico" e o contratado "Gabriel" com data de inicio "10/01/2016" e data de termino "10/01/2017" está na lista de contratos salvos
		When eu tento criar um contrato com contratante "Nautico" ,  contratado "Gabriel" ,data de início "10/12/2016", data de termino "10/12/2017",valor "1200"
		Then aparecera uma mensagem de erro na tela 

	Scenario: cancelamento de contrato

		Given o sistema tem um contrato com o jogador "Carlos" no periodo de "10/10/2010" até "10/10/2016" salvo com nome "C-10-10.pdf"
		When eu deleto o contrato de jogador "Carlos" do periodo de "10/10/2010" até"10/10/2016"
		Then o contrato de jogador "Carlos" do periodo de "10/10/2010" até "10/10/2016" é corretamente removido do sistema


	Scenario: cancelamento de contrato com prazo expirado

		Given o sistema tem um contrato com o jogador "Carlos" no periodo de "10/10/2010" até "10/10/2012" salvo com nome "C-10-10.pdf"
		When eu deleto o contrato de jogador "Carlos" do periodo de "10/10/2010" até "10/10/2012"
		Then o contrato de jogador "Carlos" do periodo de "10/10/2010" até "10/10/2012" não é removido por que não é possivel remover um 			contrato com prazo expirado


	Scenario: cancelamento de contrato GUI

		Given eu estou na pagina de vizualização de contratos
		And	tem o sistema tem apenas um contrato armazenado com o jogador "Carlos" no Periodo de "10/10/2010" até "10/10/2016"
		When eu dou um click para remover o contrato de jogador "Carlos" do periodo de "10/10/2010" até "10/10/2016"
		Then a mensagem de confirmação do cancelamento "o contrato foi removido com sucesso" é mostrada


	Scenario: cancelamento de contrato com prazo expirado GUI

		Given eu estou na pagina de vizualização de contratos
		And	tem o sistema tem apenas um contrato armazenado com o jogador "Carlos" no periodo de "10/10/2010" até "10/10/2016"
		When eu dou um click para remover o contrato de jogador "Carlos" do periodo de "10/10/2010" até "10/10/2016"
		Then a mensagem de erro do cancelamento "não é possivel remover contrato com data expirada" é mostrada