Feature: Contratos de atletas
  As a usuário do software de GA
  I want controlar os contratos dos atletas cadastrados
  So that eu consigo estabelecer cláusulas e salário dos mesmos

  #CONTROLADOR

  Scenario: Adição de contrato com clausulas conflitantes
    Given o atleta "Carlinhos Bala" de CPF "123.132.123.45", data de nascimento "10/10/1980" e posição "atacante" já está cadastrado no sistema
    When eu tento cadastrar um contrato para o atleta "Carlinhos Bala" de CPF "123.123.123.45" com as cláusulas "1" e "2" selecionadas
    Then o contrato não é armazenado no sistema

  Scenario: Adição de contrato
    Given o atleta "Carlinhos Bala" de CPF "123.132.123.45", data de nascimento "10/10/1980" e posição "atacante" já está cadastrado no sistema
    And o atleta "Carlinhos Bala" não tem nenhum contrato
    When eu crio um novo contrato para o atleta "Carlinhos Bala" com salário de "10000", com vigência a partir de "10/10/2016" e duração de "12" mêses
    Then o contrato é armazenado no sistema

  #GUI

  Scenario: Adição de um novo contrato
    Given o atleta "Carlinhos Bala" já está cadastrado
    And eu estou na página de cadastro de novo contrato
    When eu cadastro um contrato para o atleta "Carlinhos Bala" com salário de "10000.00", duração de "6" mêses e vinculo a partir de hoje
    Then eu vejo uma mensagem de contrato cadastrado com sucesso

  Scenario: Adição de dois contratos com mesma data de vigência
    Given o atleta "Carlinhos Bala" já está cadastrado
    When eu tento cadastrar dois contratos com datas de vigência coincidentes para o atleta "Carlinhos Bala"
    Then eu vejo uma mensagem de erro de contratos conflitantes