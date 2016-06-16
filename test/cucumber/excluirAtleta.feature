Feature: Excluir Atleta
  As a usu?rio do sistema
  I want remover um atleta
  So that eu posso remover os dados do atletas de um clube


  Scenario: Excluir Atleta Novo no Sistema com sucesso
    Given o atleta de CPF "863923834-34" esta cadastrado no sistema
    When tento excluir o atleta de CPF "863923834-34"
    Then O atleta de cpf "863923834-34" e devidamente removido do sistema

  Scenario: Excluir Atleta Novo do Sistama com Sucesso(web)
    Given eu estou na pagina de atletas
    And eu visualizo a lista de todos os atletas
    When eu tento remover o atleta de CPF "863923834-34"
    Then eu poderei ver uma mensagem de confirmacao na tela


  @ignore
  Scenario: Excluir o atleta "Pedro" com Sucesso
    Given O sistema tem um atleta de nome "Pedro" e  com o CPF "863923834-34"
    When eu excluo o atleta de CPF "863923834-34"
    Then O atleta CPF "863923834-34" eh devidamente removido do sistema

   @ignore
  Scenario: Excluir o atleta ?Pedro? com fracasso
    Given O sistema n?o tem um atleta com o CPF "863923834-34" e o nome "Pedro"
    When eu excluo o atleta de CPF "863923834-34"
    Then O atleta de CPF ?01234567890? n?o existe no sistema

  @ignore
  Scenario: Excluir Atleta Novo no Sistema com fracasso
    Given o atleta de CPF "863923834-34" n?o est? cadastrado no sistema
    When tento excluir o atleta de CPF "863923834-34"
    Then a base de dados n?o sofre alteracao

  @ignore
  Scenario: Excluir o atleta "Pedro" com Sucesso
    Given O sistema tem um atleta com o CPF "863923834-34" e nome "Pedro"
    When eu excluo o atleta de CPF "863923834-34"
    Then O atleta CPF "863923834-34" eh devidamente removido do sistema