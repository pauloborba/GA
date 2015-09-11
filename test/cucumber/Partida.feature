Feature: Partida

As a membro administrador do Grupo de Atletas
I want to adicionar e modificar partidas do Sistema de Gerenciamento de Atletas
So that eu posso adicionar novas partidas e modificar seus jogadores, situacoes e placares

Scenario: Registrar Modificacao de Placar

Given que eu tenha a partida "1" salva no sistema e placar "1 x 0"
And eu estou logado como administrador "Augusto"
When eu altero o placar da partida de numero "1" de "1 x 0" para "2 x 0"
Then eu salvo a data e o nome do administrador "Augusto" que fez as modificacoes

Scenario: Modificar uma partida Em Andamento para Completa    

Given que eu estou na pagina de partidas
And eu seleciono a opcao "modificar" para partida de numero "4"
When eu seleciono a situacao da partida "4" de "Em andamento" para "Completa"
And eu seleciono "salvar"
Then uma mensagem de sucesso e exibida na tela

Scenario: Numero de Jogadores Titulares insuficientes para partida

Given que eu estou na pagina de partidas
And eu seleciono a opcao "modificar" para partida de numero "6"
And eu tenha selecionado o numero de jogadores titulares da partida de numero "6" de "11" para "10"
When eu seleciono "salvar"
Then uma mensagem de erro e visualizada no topo da página

Scenario: Registrar Modificacao de Numero de Jogadores

Given que eu tenha a partida "10" salva no sistema
And eu estou logado como administrador "Jose"
When eu altero o numero de jogadores da partida "10" de "11" para "15"
Then eu salvo a data e o nome do administrador "Jose" que fez as modificacoes
