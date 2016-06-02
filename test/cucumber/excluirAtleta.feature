Feature: Excluir Atleta
  As a usu?rio do sistema
  I want remover um atleta
  So that eu posso remover os dados do atletas de um clube


  Scenario: Excluir o atleta ?Pedro? com Sucesso
    Given O sistema tem um atleta com o CPF "01234567890" e nome "Pedro"
    When eu excluo o atleta de CPF "01234567890"
    Then O atleta CPF "01234567890" eh devidamente removido do sistema

  Scenario: Excluir o atleta ?Pedro? com fracasso
    Given O sistema n?o tem um atleta com o CPF ?01234567890? e o nome "Pedro"
    When eu excluo o atleta de CPF ?01234567890?
    Then O atleta de CPF ?01234567890? n?o existe no sistema


  Scenario: Excluir Atleta Novo no Sistema com sucesso
    Given o atleta de CPF ?01234567890? est? cadastrado no sistema
    When tento excluir o atleta de CPF ?01234567890?
    Then O sistema remove o atleta com sucesso

  Scenario: Excluir Atleta Novo no Sistema com fracasso
    Given o atleta de CPF ?01234567890? n?o est? cadastrado no sistema
    When tento excluir o atleta de CPF ?01234567890?
    Then a base de dados n?o sofre alteracao