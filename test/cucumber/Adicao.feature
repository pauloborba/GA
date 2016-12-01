Feature: Cadastro de jogadores
  As a user of the system,
  I Will be alowed to register athletes,
  So see theyr informations like CPF, Full name, Position and other personal information.


    #Controller

  Scenario: Adicionar Jogador Já cadastrado
    Given o Jogador com CPF "123.456.789-10" e com nome "j1" Já está cadastrado
    When tentar inserir um jogador com CPF "123.456.789-10" e com nome "j2" na lista de jogadores
    Then o Jogador não é inserido
    And o jogador "j1" existente continua na lista

  Scenario: Adicionar Jogador Não Existente
    Given não existe jogador com o CPF "12345678910" salvo
    When tento inserir um jogador com CPF "12345678910" e nome "Magrão"
    Then o jogador de CPF "12345678910" é salvo com sucesso


    #GUI

  Scenario: Cadastro de jogador
    Given eu estou na página de cadastro de atletas
    When eu preencho o formulário para o atleta "Cristiano Ronaldo" de CPF "123.132.123-45", data de nascimento "10/10/1980" e posição "atacante"
    And eu submeto o formulário de cadastro de jogador
    Then eu vou para a página de confirmação de cadastro de jogador
    And eu vejo a mensagem "cadastrado com sucesso"


  Scenario: Cadastro de dois atletas com o mesmo CPF
    Given o atleta "Ronaldo" de CPF "111.111.111-11" já está cadastrado
    When eu tento cadastrar o atleta de nome "Ze marcos", CPF "111.111.111-11"
    Then eu vou para a página de confirmação de cadastro de jogador
    And eu vejo uma mensagem de erro indicando que o CPF já cadastrado

