Feature: Atleta
  As a usuario cadastrado no sistema
  I want adicionar e editar atletas
  So that eu possa gerenciar as informacoes dos atletas

  Scenario: Adicionar atleta novo
    Given o sistema nao tem o atleta com o CPF "09719992836"
    When eu adiciono o atleta com o CPF "09719992836"
    Then o atleta com o CPF "09719992836" esta devidamente armazenado pelo sistema

   Scenario: Adicionar atleta duplicado
    Given o atleta esta armazenado no sistema com o CPF "08976898765"
    When eu adicionar o atleta com o CPF "08976898765"
    Then o atleta com o CPF "08976898765" nao e armazenado duas vezes

   Scenario: Adicionar Atleta novo web

    Given estou no menu de Atleta
    And o atleta nao aparece na lista de atletas cadastrados
    When eu seleciono a opcao New Atleta
    And eu preencho os dados do atleta com nome "Gabriel", email "ghdr@cin.ufpe.br", telefone "99878798", CPF "08976898765", RG "8765667", altura "1,75", peso "70", posicao "atacante", categoria "sub 17" e alojamento "true"
    And eu seleciono a opcao Create
    Then poderei ver os detalhes do atleta salvo no sistema

 Scenario: Adicionar atleta duplicado web
    Given estou no menu de Atletas
    And o atleta aparece na lista de atletas cadastrados
    When eu seleciono a opcao New Atleta
    And eu preencho os dados do atleta com nome "Gabriel", email "ghdr@cin.ufpe.br", telefone "99878798", CPF "08976898765", RG "8765667", altura "1,75", peso "70", posicao "atacante", categoria "sub 17" e alojamento "true"
    And eu seleciono a opcao Create
    Then eu poderei ver uma mensagem de erro

  Scenario: Editar cpf Atleta
    Given o sistema possui um atleta com cpf "08976898765"
    When eu edito o cpf para "08976898763"
    Then O sistema deve armazenar o atleta com a nova informacao de cpf no banco de dados

  Scenario: Editar atleta e deixar campos obrigatorios em branco
    Given o sistema possui um atleta com cpf "08976898765"
    When eu nao preencho o campo cpf
    And confirmo minhas mudancas
    Then O sistema nao devera armazenar as mudancas

  Scenario: Editar Atleta web sucesso
    Given estou na pagina de editar atletas
    When eu preencho o campo de cpf com "11281727373"
    And eu preencho os campos requeridos corretamente
    And envio minhas mudancas
    Then eu devo ver uma mensagem indicando que as mudancas foram salvas corretamente

  Scenario: Edicao falha de dados do atleta
    Given estou na pagina de editar atletas
    When eu preencho o campo de cpf com ""
    And eu preencho os campos requeridos corretamente
    And envio minhas mudancas
    Then eu devo ver uma mensagem indicando que um erro aconteceu
