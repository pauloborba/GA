Feature: Adicionar Atleta
  As a Usuário do sistema
  I want Adicionar um atleta
  So that Ter o cadastro do atleta no sistema

  Scenario: Adicionar Atleta Sem sucesso
    Given Um atleta de CPF "863923834-34" se encontra cadastrado no sistema
    When Tento cadastrar um novo atleta "Grafite" com o CPF "863923834-34"
    Then O sistema não permite o cadastro duplicado do CPF "863923834-34" .

  Scenario: Adicionar Atleta Sem sucesso web
    Given Um atleta de CPF "863923834-34" se encontra cadastrado no sistema
    And Estou no menu Atletas
    When Seleciono a opção Adicionar Atleta
    And Tento cadastrar um novo atleta "Ryan" com o CPF "863923834-34"
    Then Vejo uma mensagem erro "Este CPF já está cadastrado"

  Scenario: Adicionar Atleta no sistema com sucesso
    Given O atleta de CPF "01234567890" não esta cadastrado no sistema
    When Eu cadastro o atleta de CPF "01234567890"
    Then O sistema adiciona o atleta de CPF "01234567890" com sucesso

  Scenario: Adicionar Atleta no sistema com sucesso web
    Given Estou no menu de Atletas
    And O atleta de CPF "01234567890" e nome "Pedro" não esta na lista de atletas
    When Eu tento cadastrar o atleta "Pedro" com o CPF "01234567890"
    Then Eu posso ver a tela de visualização de Atleta e o nome "Pedro" e CPF "01234567890"
