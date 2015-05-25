Feature: Partidas
As a supervisor cadastrado no sistema
I want do criar, editar, listar e buscar partidas
So that eu poderei assim apresenta-las em paginas web mostrando seu conteudo.

Scenario: clicar na opcao criar partida 
Given estou na pagina principal do time
When eu clico na opcao "nova partida"
Then a pagina de "nova partida" e exibida
And eu posso preencher o formulario de cadastro.

Scenario: clicar na opcao listar partidas 
Given estou na pagina principal do time
When eu clico na opcao "listar partidas"
Then uma nova pagina e aberta
And e exibida a lista com todas as partidas realacionadas ao time.

Scenario: duplicata de partida
Given que existe uma partida com data "12/03/2015", com nome "Nautico VS Sport", com tag "Serie A".
When  eu crio uma partida com data "12/03/2015",  com nome "Nautico VS Sport", com tag "Serie A".
Then  a partida nao e salva duas vezes.

