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

Scenario: pontuação negativa no cadastro de partidas
Given estou cadastrando uma partida
When eu tento confirmar o cadastro de uma partida com um dos campos de pontuação negativa
Then uma mensagem de erro aparece para o usuário

Scenario: alterar placar na partida
As a supervisor cadastrado no sistema.
Given estou visualizando uma partida
When eu adiciono um ponto para o "Nautico" na partida "Nautico VS Sport" com placar "0" x "4"
Then o novo placar da partida é "1" para o "Náutico" e "4" para o "Sport"

Scenario: listar jogadores de um dos times de uma partida
Given estou visualizando uma partida do "Nautico VS Sport"
When eu clico no botão Expandir dos jogadores do "Náutico"
Then serão exibidos os jogadores do "Náutico"

Scenario: mudar time de partida
Given estou visualizando a página de edição de uma partida
When eu clico na opção "alterar time visitante"
Then uma seleção de times cadastrados é mostrada com um seletor
And é removida a lista de jogadores do time visitante da partida
