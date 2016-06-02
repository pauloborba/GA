Feature: Excluir Atleta
  As a usuário do sistema
  I want remover um atleta
  So that eu posso remover os dados do atletas de um clube


  Scenario: Excluir o atleta “Pedro” com Sucesso
    Given O sistema tem um atleta com o CPF “01234567890” e o nome "Pedro"
    When eu excluo o atleta de CPF “01234567890”
    Then O atleta CPF “01234567890” é devidamente removido do sistema

  Scenario: Excluir o atleta “Pedro” com fracasso
    Given O sistema não tem um atleta com o CPF “01234567890” e o nome "Pedro"
    When eu excluo o atleta de CPF “01234567890”
    Then O atleta de CPF “01234567890” não existe no sistema


  Scenario: Excluir Atleta Novo no Sistema com sucesso
    Given o atleta de CPF “01234567890” está cadastrado no sistema
    When tento excluir o atleta de CPF “01234567890”
    Then O sistema remove o atleta com sucesso

  Scenario: Excluir Atleta Novo no Sistema com fracasso
    Given o atleta de CPF “01234567890” não está cadastrado no sistema
    When tento excluir o atleta de CPF “01234567890”
    Then a base de dados não sofre alteracao