Feature: Contrato
  As a usuario do sistema
  I want adicionar e cancelar contrato
  So that eu posso gerenciar os contratos dos atletas de um clube


  Scenario: adicionar novo contrato
    Given nao existe o contrato com contratante "Nautico" e o contratado "Gabriel" com data de inicio "21/01/2015" e data de termino "21/01/2016"
    When eu crio um novo contrato com o contratante "Nautico" e o contratado "Gabriel" com data de inicio "21/01/2015" e data de termino "21/01/2016"
    Then o contrato sera salvo no sistema

  Scenario: adicionar novo contrato web
    Given eu estou na pagina de Contrato
    And eu visualizo a lista de todos os contratos
    When eu seleciono a opção New Contrato
    And preencho os detalhes com contratante "Nautico",contratado "Arthur", data de início "19/10/2015" ,data de termino "19/10/2016", valor "1200"
    And eu seleciono a opção Create
    Then poderei ver os detalhes do contrato salvos no sistema

  Scenario: adicionar novo contrato com data de termino antes do prazo acabar
    Given existe o contrato com contratante "Nautico" e o contratado "Gabriel" com data de inicio "21/01/2015" e data de termino "21/01/2016"
    When eu adicionar o contrato com o contratante "Nautico" e o contratado "Gabriel" com data de inicio "21/01/2015" e data de termino "21/01/2016"
    Then o contrato nao sera salvo no sistema pois ja existe um contrato valido com o contratante "Nautico" e contratado "Gabriel"com data de inicio "21/01/2015" e data de termino "21/01/2016"


  Scenario: adicionar novo contrato com data de termino antes do prazo acabar web
    Given eu estou na pagina de Contrato
    And  eu visualizo a lista de todos os contratos
    And  o contrato aparece na lista de contratos cadastrados
    When eu seleciono a opção New Contrato
    And preencho os detalhes com contratante "Nautico", contratado "Gabriel" com data de inicio "21/01/2015" e data de termino "21/01/2016",valor "1200"
    And seleciono a opção Create
    Then aparecera uma mensagem de erro na tela
