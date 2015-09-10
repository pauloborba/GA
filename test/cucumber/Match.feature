Feature: Match

As a admin member of an Athletes Group
I want to add and modify matches of Athlete Management System
So that I can add new matches and modify them

Scenario: Registrar Modificacao de Placar

Given que eu tenha a partida "1" salva no sistema
And eu estou logado como "administrador"
When eu altero o placar da partida “1” de “1 x 0” para “2 x 0”
Then eu salvo a “data” e o nome do “administrador” que fez a modificacoes

Scenario: Modificar uma partida Em Andamento para Completa    

Given que eu estou na pagina de partidas
And eu seleciono a opcao “modificar”
When eu seleciono a situacao da partida "25" de "Em andamento" para "Completa"
And eu seleciono "salvar"
Then uma mensagem de sucesso e exibida na tela

Scenario: Numero de Jogadores Titulares insuficientes para partida

Given que eu estou na página de partidas
And eu seleciono a opcao “modificar”
And eu tenha modificado o numero de jogadores titulares para um valor menor que “11”
When eu seleciono “salvar”
Then uma mensagem de erro e visualizada no topo da página

Scenario: Registrar Modificacao de Numero de Jogadores

Given que eu tenha a partida "10" salva no sistema
And eu estou logado como "administrador"
When eu altero o numero de jogadores da partida de "11" para "15"
Then eu salvo a "data" e o nome do "administrador" que fez as modificacoes