  Feature: Remoção de atletas
    As a usuário do software de GA
    I want to remover um atleta
    So that retirar um ser como atleta do sistema

    #Controller
    Scenario: Remover atleta com contrato
      Given o atleta "Paulo Alberto" está cadastrado
      And "Paulo Alberto" tem o contrato "Contrato de Paulo Alberto"
      When "Paulo Alberto" é removido
      Then o contrato "Contrato de Paulo Alberto" é inativado

    #GUI
    Scenario: Confirmação de remoção de atleta
      Given estou na página de remoção
      And "João Luís" foi marcado para ser removido
      When eu solicito a remoção dos marcados
      Then vejo uma página de confirmação da remoção de "João Luís"
      And em seguida vejo uma página com uma nova lista sem "João Luís"

    Scenario: Confirmação parcial de remoção
      Given estou na página de confirmação de remoção de "João Pedro" e "Robert Silva"
      And seleciono apenas "João Pedro"
      When solicito a remoção
      Then vejo uma mensagem de remoção realizada com sucesso
      And em seguida vejo uma página com uma nova lista sem "João Pedro"

    Scenario: Ninguém selecionado na confirmação
      Given estou na página de confirmação de remoção de "João Luís"
      And não seleciono "João Luís"
      When solicito a remoção
      Then vejo uma mensagem informando que "João Luís" não foi removido
      And em seguida vejo uma página com uma lista com "João Luís"

    Scenario: Ninguém selecionado
      Given que ninguém foi marcado para ser removido
      When solicito a remoção
      Then vejo uma mensagem de aviso