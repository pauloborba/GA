Feature: Remover atleta
  As a usuário do software de GA
  I want remover atletas já cadastrados
  So that eu posso difenciar quem ainda permanece no clube atualmente

  #Controller
  Scenario: Desativar atleta com contrato ativo
  Given o atleta de nome "Fred", cpf "763.595.811-91", data de nascimento "12/12/1991" e posição "atacante" está cadastrado
  And "763.595.811-91" tem um contrato ativo com data inicial "12/12/1992" e data final "12/12/1993"
  When "763.595.811-91" é desativado
  Then o contrato de "763.595.811-91" com data inicial "12/12/1992" e data final "12/12/1993" é inativado


  Scenario: Tentar excluir atleta com contrato ativo
  Given o atleta de nome "Marcos", cpf "987.654.321-00", data de nascimento "12/11/1990" e posição "centro" está cadastrado
  And "987.654.321-00" tem um contrato ativo com data inicial "21/12/2009" e data final "21/12/2010"
  When é tentado remover "987.654.321-00"
  Then "987.654.321-00" não é removido

  Scenario: Tentar excluir atleta sem contrato ativo
  Given o atleta de nome "João Luíz", cpf "123.456.789-42", data de nascimento "04/05/1988" e posição "goleiro" está cadastrado
  And "123.456.789-42" não tem contratos ativos
  When é tentado remover "123.456.789-42"
  Then "123.456.789-42" é removido


#GUI
Scenario: Remoção de atleta
  Given o atleta "Carlinhos Bala" de CPF "123.132.123.45", data de nascimento "10/10/1980" e posição "atacante" está cadastrado no sistema
  When eu tento excluir o atleta "Carlinhos Bala"
  Then eu vou para a página de confirmação de remoção de atleta
  And eu vejo uma mensagem de atleta excluído com sucesso
