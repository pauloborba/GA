Feature: Notificações
  As a presidente de um time de futebol
  I Want to receber notificações sobre o meu time na minha caixa de email
  So that  alguma clausula do contrato de algum jogador for disparada ou quando o contrato do jogador estiver perto de expirar


#  Senarios de GUI

  Scenario: dados incorretos

    Given eu estou na página de adicionar novo usuário para receber notificações
    When eu preencho o campo "email" com "email@cin"
    And o campo "nome" com "nome"
    And eu solicito para adicionar novo usuário para receber notificações
    Then eu posso ver uma mensagem informando que o "email@cin" é incorreto


  Scenario: Adicionar usuário para receber notificações

    Given eu estou na página de adicionar novo usuário para receber notificações
    And o usuário "João Dantas" ainda não está cadastrado para receber notificações com o email "email@gmail.com"
    When eu preencho o campo "nome" com "João Dantas"
    And o campo "email" com "email@gmail.com"
    And eu solicito para adicionar novo usuário para receber notificações
    Then é exibido uma mensagem de confirmação


  Scenario: usuário já cadastrado para receber notificações

    Given eu estou na página de adicionar novo usuário para receber notificações
    And o usuário "João Dantas" já está cadastrado para receber notificações com o email "email@gmail.com"
    When eu adiciono "João Dantas" nas pessoas que vão receber notificações com o email "email@gmail.com"
    Then é exibido uma mensagem de erro dizendo que "João Dantas" já esta cadastrado para receber notificações com o email "email@gmail.com"


#    Senarios de controler

  Scenario: adicionar novo usuário para receber notificações

    Given o sistema não tem o usuário "João Dantas" cadastrado para receber notificações com o email "email@gmail.com"
    When eu adiciono "João Dantas" no sistema de notificações com o email "email@gmail.com"
    Then o usuário "João Dantas" é adicionado nas pessoas que vão receber as notificações com o email "email@gmail.com"

  Scenario: usuário duplicado

    Given o sistema tem o usuário "João Dantas" cadastrado para receber notificações com o email "email@gmail.com"
    When eu adiciono "João Dantas" no sistema de notificações com o email "email@gmail.com"
    Then o sistema não é modificado


  Scenario: notificação de fim de contrato

    Given o contrato de "José Santos" falta "30" dias para seu termino
    And o usuário "João Dantas" está cadastrado para receber notificações com o email "email@gmail.com"
    When na verificação diária o sistema verifica que o contrato de "José Santos" falta "30" dias para ser encerrado
    Then um email é enviado para "João Dantas"