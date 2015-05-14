@i9n
Feature: Partidas
As a supervisor cadastrado no sistema.
I want do criar, editar, listar e buscar partidas.
So that eu poderei assim apresentá-las em paginas web mostrando seu conteúdo.

Scenario: nova partida
Given que não existe uma partida com data “12/03/2015”, com nome “Nautico VS Sport”, com tag “Serie A”.
When  eu crio uma partida com data “12/03/2015”,  com nome “Nautico VS Sport”, com tag “Serie A”.
Then  a partida com data “12/03/2015”, com nome “Nautico VS Sport”, com tag “Serie A” é salva no sistema.