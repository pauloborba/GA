Feature: Contratos de atletas
  As a usuário do software de GA
  I want controlar os contratos dos atletas cadastrados
  So that eu consigo estabelecer cláusulas e salário dos mesmos

  @ignore
  Scenario: Adição de um novo contrato
    Given eu estou na página de cadastro de novo contrato
    And o atleta "Carlinhos Bala" de CPF "123.123.123.45" está cadastrado no sistema
    When eu cadastro um contrato para o atleta "Carlinhos Bala"
    Then eu vejo uma mensagem de sucesso confirmando o novo contrato

  Scenario: Adição de contrato para atleta com contrato já vigente
    Given o atleta "Carlinho Bala" de CPF "123.123.123.45" está cadastrado no sistema
    And o atleta "Carlinhos Bala" de CPF "123.123.123.45" já tem um contrato vigente
    When eu tento cadastrar um novo contrato para o atleta "Carlinhos Bala" de CPF "123.123.123.45"
    Then a aplicação não altera o estado