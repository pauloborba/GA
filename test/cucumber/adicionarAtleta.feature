Feature: Adicionar Atleta
  As a Usuário do sistema
  I want Adicionar um atleta
  So that Ter o cadastro do atleta no sistema

  Scenario: Adicionar Atleta Sem sucesso
    Given Um atleta de nome "pedro" e CPF "863923834-34" se encontra cadastrado no sistema
    When Tento cadastrar um novo atleta "Grafite" com o CPF "863923834-34"
    Then O sistema não permite o cadastro duplicado do CPF "863923834-34"





