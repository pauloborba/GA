Feature: Partidas
As a supervisor cadastrado no sistema
I want do criar, editar, listar e buscar partidas
So that eu poderei assim apresenta-las em paginas web mostrando seu conteudo.

Scenario: clicar na opcao criar partida 
Given estou na pagina principal do time
When eu clico na opcao "nova partida"
Then a pagina de "nova partida" e exibida
And eu posso preencher o formulario de cadastro.
