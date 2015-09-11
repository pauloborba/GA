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
    Given estou no menu de Atletas
    And o atleta de CPF "08976898765" nao aparece na lista de atletas cadastrados
    When eu seleciono a opcao "Adicionar"
    And eu preencho os dados do atleta com nome “Gabriel”, email "ghdr@cin.ufpe.br", telefone "99878798", data_nascimento "01/01/91", CPF "08976898765", RG "8765667", altura "1,75cm", peso "70kg", posicao_joga "atacante", categoria "sub 17" e alojamento_clube "sim"
    And eu seleciono a opcao "Cadastrar"
    Then eu posso ver uma mensagem de confirmacao

  Scenario: Adicionar atleta duplicado web
    Given estou no menu de Atletas
    And o atleta de CPF "08976898765" nao aparece na lista de atletas cadastrados
    When eu seleciono a opcao "Adicionar"
    And eu preencho os dados do atleta com nome “Gabriel”, email "ghdr@cin.ufpe.br", telefone "99878798", data_nascimento "01/01/91", CPF "08976898765", RG "8765667", altura "1,75cm", peso "70kg", posicao_joga "atacante", categoria "sub 17" e alojamento_clube "sim"
    And eu seleciono a opcao "Cadastrar"
    Then eu posso ver uma mensagem de erro



    	

