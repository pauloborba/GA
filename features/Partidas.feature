Feature: Partidas
	As a supervisor cadastrado no sistema
	I want do criar, editar, listar e buscar partidas
	So that eu poderei assim apresenta-las em pagina web mostrando seu conteudo

Scenario: clicar na opcao criar partida 
	Given estou na pagina principal do time
	When eu clico na opcao "nova partida"
	Then a pagina de "nova partida" e exibida
	And eu posso preencher o formulario de cadastro

Scenario: clicar na opcao listar partidas 
	Given estou na pagina principal do time
	And foi criada uma partida com nome "Sport VS Nautico", data "13/03/2005" e tag "serie A"
	And foi criada uma partida com nome "Sport VS Santa Cruz", data "15/03/2005" e tag "Pernambucano"
	And foi criada uma partida com nome "Sport VS Nautico", data "20/04/2005" e tag "Pernambucano"
	When eu listar as partidas
	Then é exibida a lista com as três partidas criadas

Scenario: duplicata de partida
	Given que existe uma partida com data "12/03/2015", com nome "Nautico VS Sport", com tag "Serie A"
	When  eu crio uma partida com data "12/03/2015",  com nome "Nautico VS Sport", com tag "Serie A"
	Then  a partida com data "12/03/2015",  com nome "Nautico VS Sport", com tag "Serie A" nao e salva duas vezes

Scenario: buscar partida inexistente
	Given que nao exista no sistema a partida com data "12/03/2015", com nome "Nautico VS Sport", com tag "Serie A"
	When eu busco uma partida com a data "12/03/2015", nome que contenha a palavra "Sport" e que tenha a tag "Serie A"
	Then o sistema nao exibe nenhuma partida