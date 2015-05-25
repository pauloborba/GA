Feature: Partidas
As a supervisor cadastrado no sistema.
I want do criar, editar, listar e buscar partidas.
So that eu poderei assim apresenta-las em paginas web mostrando seu conteudo.


Scenario: campo faltando no cadastro de partidas 
Given estou na pagina de cadastro de partida
When eu tento confirmar o cadastro de uma partida com campos faltando
Then uma mensagem de erro aparece para o usuário

Scenario: cadastro partidas inválidas
Given estou na pagina de cadastro de partida
When eu tento confirmar o cadastro de uma partida inválida
Then a partida não é  cadastrada

Scenario:  Listar partidas por data
Given estou visualizando a lista de partidas
When eu clico no campo “data”
Then serão exibidas as partidas ordenadas pela sua data
