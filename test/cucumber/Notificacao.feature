Feature: Notificação
As a usuário do sistema
I want receber notificações da expiração do contrato do atleta
So that posso renovar antes do término

Scenario: Enviar Notificação
Given O atleta "Deco" de CPF "849023845-03" está cadastrado no sistema 
When O contrato do jogador de CPF "849023845-03" está a exato "6" meses de expirar
Then O sistema envia uma notificação para o email do administrador

Scenario: Enviar Notificação web
Given Estou no menu de Contratos
And O atleta “Deco” está cadastrado no sistema
When O contrato de “Deco” está a exato “6 meses” de expirar
Then Aparece a mensagem de alerta “O contrado de Deco está a 6 meses do término”
