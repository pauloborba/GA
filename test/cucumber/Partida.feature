Feature: Partidas
  As a usuário do software de GA
  I want manter um histórico de partidas, a escalação e os gols das mesmas
  So that eu consigo acompanhar a evolução do clube na temporada

  Scenario: Adição de partida sem jogadores escalados
  	Given eu estou na página de cadastro de partida
  	When eu cadastro uma partida para o jogo contra o "Atlético mineiro", no dia "20/06/2016" em que o clube sofreu "2" gols
  	Then eu vou para a página de confirmação de cadastro de partida
  	And eu vejo uma mensagem de erro informando que pelo menos 1 jogador deveria ter sido escalado

  Scenario: Adição de partida com jogadores escalados
  	Given o atleta "Carlinhos Bala" de CPF "123.132.123.45", data de nascimento "10/10/1980" e posição "atacante" está cadastrado no sistema
  	And eu estou na página de cadastro de partida
  	When eu cadastro uma partida para o jogo contra o "Corinthians", no dia "30/07/2016" em que o clube sofreu "2" gols com o atleta "Carlinhos Bala" como titular
  	Then eu vou para a página de confirmação de cadastro de partida
  	And eu vejo uma mensagem de confirmação de partida cadastrada com sucesso

  	#Controlador

 Scenario: Adição de partida não cadastrada no sistema
    Given o sistema não possua nenhuma partida no dia "22/05/2016"
    When eu crio uma partida no dia "22/05/2016", contra o "Atlético mineiro", em que o clube sofreu "2" gols
    Then a partida do dia "22/05/2016" é salva no sistema

 Scenario: Adição de partida já existente no sistema
    Given o sistema possui uma partida no dia "22/06/2016"
    When eu crio uma partida no dia "22/06/2016", contra o "Atlético mineiro", em que o clube sofreu "2" gols
    Then o sistema só armazena uma partida para o dia "22/06/2016"