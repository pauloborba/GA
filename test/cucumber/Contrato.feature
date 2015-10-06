Feature: Contrato
  As a usuario do sistema
  I want to adicionar e cancelar contrato
  So that eu posso gerenciar os contratos de atleta de um clube
  @ignore
  Scenario: cancelamento de contrato
    Given o sistema tem um contrato com o jogador "Carlos" no periodo de "10/10/2010" ate "10/10/2016" no clube "ABC"
    When eu deleto o contrato de jogador "Carlos" do periodo de "10/10/2010" ate "10/10/2016" no clube "ABC"
    Then o contrato de jogador "Carlos" do periodo de "10/10/2010" ate "10/10/2016" e corretamente removido do sistema

  #@ignore
  #Scenario: cancelamento de contrato com prazo expirado
    #Given o sistema tem um contrato com o jogador "Carlos" no periodo de "10/10/2010" ate "10/10/2012" no clube "ABC"2
    #When eu deleto o contrato de jogador "Carlos" do periodo de "10/10/2010" ate "10/10/2012" no clube "ABC"
    #Then o contrato de jogador "Carlos" do periodo de "10/10/2010" ate "10/10/2012" no clube "ABC" nao e removido por que nao e possivel remover um contrato com prazo expirado
  @ignore
  Scenario: cancelamento de contrato GUI
    Given eu estou na pagina de vizualizacao de contratos
    And tem o sistema tem apenas um contrato armazenado com o jogador "Carlos" no periodo de "10/10/2010" ate "10/10/2016" no clube "ABC"
    When eu dou um click para remover o contrato de jogador "Carlos" do periodo de "10/10/2010" ate "10/10/2016" no clube "ABC"
    Then a mensagem de confirmacao do cancelamento "o contrato foi removido com sucesso" e mostrada

  #@ignore
  #Scenario: cancelamento de contrato com prazo expirado GUI
  #  Given eu estou na pagina de vizualizacao de contratos
  #  And	tem o sistema tem apenas um contrato armazenado com o jogador "Carlos" no periodo de "10/10/2010" ate "10/10/2016" no clube "ABC"
  #  When eu dou um click para remover o contrato de jogador "Carlos" do periodo de "10/10/2010" ate "10/10/2016" no clube "ABC"
  #  Then a mensagem de erro do cancelamento "nao e possivel remover contrato com data expirada" e mostrada

