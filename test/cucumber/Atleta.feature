Feature: Atleta
  As a usuario cadastrado no sistema
  I want adicionar e editar atletas
  So that eu possa gerenciar as informacoes dos atletas

  Scenario: Adicionar atleta novo
    Given o sistema nao tem o atleta com o CPF "09719992836"
    When eu adiciono o atleta com o CPF "09719992836"
    Then o atleta com o CPF "09719992836" esta devidamente armazenado pelo sistema

  Scenario: Adicionar atleta duplicado
    Given o atleta esta armazenado no sistema com o CPF "09719992836"
    When eu adicionar o atleta com o CPF "09719992836"
    Then o atleta com o CPF "09719992836" nao e armazenado duas vezes

  Scenario: Adicionar Atleta novo web
    Given estou no menu de Atleta
    And o atleta com o cpf "08976898765" nao aparece na lista de atletas cadastrados
    When eu tento adicionar um novo atleta com nome "Rodolfo", email "rjpm@cin.ufpe.br", telefone "987655562", CPF "08976898765", RG "87655565", altura "1,75", peso "70", posicao "goleiro", categoria "sub 17" e alojamento "true"
    Then poderei ver o atleta salvo na lista de atletas

  Scenario: Adicionar atleta duplicado web
    Given estou no menu de Atleta
    And o atleta com o cpf "08976898765" aparece na lista de atletas cadastrados
    When eu tento adicionar um novo atleta com nome "Rodolfo", email "rjpm@cin.ufpe.br", telefone "987655562", CPF "08976898765", RG "87655565", altura "1,75", peso "70", posicao "goleiro", categoria "sub 17" e alojamento "true"
    Then eu poderei ver uma mensagem de erro

  @ignore
  Scenario: Editar cpf Atleta
    Given o sistema possui um atleta com cpf "08976898765"
    When eu edito o cpf para "08976898763"
    Then O sistema deve armazenar o atleta com a nova informacao de cpf no banco de dados

  @ignore
  Scenario: Editar atleta e deixar campos obrigatorios em branco
    Given o sistema possui um atleta com CPF "11281727371"
    When eu edito as informacoes do atleta com CPF "11281727371"
    And deixo um campo obrigatorio em branco
    Then o atleta com cpf "11281727371" nao tem suas informacoes alteradas

  @ignore
  Scenario: Editar Atleta web sucesso
    Given estou na pagina de editar atletas
    When eu preencho o campo de cpf com "11281727373"
    And eu preencho os campos requeridos corretamente
    And envio minhas mudancas
    Then eu devo ver uma mensagem indicando que as mudancas foram salvas corretamente

  @ignore
  Scenario: Editar atleta e deixar campo obrigatorio em branco
    Given estou na pagina de Atletas
    When eu seleciono a opcao "Editar"
    And eu altero os dados
    And deixo um campo obrigatorio em branco
    And seleciono a opcao "Salvar"
    Then eu posso ver uma mensagem de erro
