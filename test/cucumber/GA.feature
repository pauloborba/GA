Feature: Remoção de atletas
  As a usuário do software de GA
  I want to remover um atleta
  So that retirar um ser como atleta do sistema

    #Controller
  Scenario: Desativar atleta com contrato
    Given o atleta com cpf "763.595.811-91" está cadastrado
    And "763.595.811-91" tem o contrato "Contrato de Paulo Alberto"
    When "763.595.811-91" é desativado
    Then o contrato "Contrato de Paulo Alberto" é inativado

  Scenario: Tentar remover atleta com contrato
    Given o atleta com cpf "987.654.321-00" está cadastrado
    And "987.654.321-00" tem o contrato "Contrato de Paulo"
    When "987.654.321-00" é desativado
    And é tentado remover "987.654.321-00"
    Then "987.654.321-00" não é removido


    #GUI
  Scenario: Remover atleta sem contrato
    Given estou na página de atletas
    And criei um atleta com cpf "763.595.811-93"
    And desativei o atleta selecionado
    When seleciono o atleta de cpf "763.595.811-93"
    And tento remover o atleta selecionado
    Then vejo a página de atletas sem "763.595.811-93"

  Scenario: Tentativa de editar atleta desativado
    Given estou na página de atletas
    And criei um atleta com cpf "763.595.811-92"
    And desativei o atleta selecionado
    When seleciono o atleta de cpf "763.595.811-92"
    Then vejo que não há opção para editá-lo