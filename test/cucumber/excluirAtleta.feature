Feature: Excluir Atleta
  As a usu?rio do sistema
  I want remover um atleta
  So that eu posso remover os dados do atletas de um clube


  Scenario: Excluir Atleta Novo do Sistama com Sucesso(web)
    Given eu estou na pagina de atletas
    And eu visualizo a lista de todos os atletas
    When eu tento remover o atleta de CPF "863923834-34"
    Then eu poderei ver uma mensagem de confirmacao na tela

  Scenario: Excluir Atleta Novo no Sistema com sucesso
    Given o atleta de CPF "863923834-34" esta cadastrado no sistema
    When tento excluir o atleta de CPF "863923834-34"
    Then O atleta de cpf "863923834-34" e devidamente removido do sistema

  Scenario: Excluir Atleta Novo no Sistema sem sucesso
    Given o atleta de CPF "863923835-34" nao esta cadastrado no sistema
    When eu tento excluir o atleta de CPF "863923835-34"
    Then o sistema nao sofre nenhuma alteracao


