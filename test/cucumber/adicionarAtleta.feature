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


