@i9n
Feature: Partidas
As a supervisor cadastrado no sistema.
I want do criar, editar, listar e buscar partidas.
So that eu poderei assim apresentá-las em paginas web mostrando seu conteúdo.

Scenario: nova partida
Given que nao existe uma partida com data “12/03/2015”, com nome “Nautico VS Sport”, com tag “Serie A”.
When  eu crio uma partida com data “12/03/2015”,  com nome “Nautico VS Sport”, com tag “Serie A”.
Then  a partida com data “12/03/2015”, com nome “Nautico VS Sport”, com tag “Serie A” eh salva no sistema.

Scenario: listar partidas existentes
Given que eu tenha no sistema a partida com data "12/03/2015”, com nome “Nautico VS Sport”, com tag “Serie A”.
When eu vejo a lista de partidas existentes.
Then minha lista de paridas contem a partida com data "12/03/2015”, com nome “Nautico VS Sport”, com tag “Serie A”.

Scenario: editar partida existente
Given que exite uma parida com data "12/03/2015”, com nome “Nautico VS Sport”, com tag “Serie A”.
When eu modifico a data atual da partida por "02/04/2015”, ou o nome atual da partida por “Nautico VS Santa”, ou a tag atual por “Serie B”.
Then sera salvo no sistema a atualizacao dessa partida.

Scenario: buscar partidas existentes
Given que tenha no sistema a partida com data "12/03/2015”, e/ou com nome “Nautico VS Sport”, e/ou com tag “Serie A”.
When eu busco uma partida com a data " 12/03/2015", e/ou com o nome que contenha a palavra "Sport" e/ou que tenha  a tag "Serie A".
Then a lista de partidas buscadas, que cotem a data " 12/03/2015", e/ou com o nome que contenha a palavra "Sport" e/ou que tenha  a tag "Serie A", eh mostrada.
