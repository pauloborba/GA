Feature: Notificação
As a usuário do sistema
I want receber notificações da expiração do contrato do atleta
So that posso renovar antes do término

Scenario: Enviar Notificação
Given O atleta “Deco” está cadastrado no sistema. 
When O contrato de “Deco” está a exato “6 meses” de expirar
Then O sistema exibe uma notificação e envia uma cópia para o email do administrador.

Scenario: Enviar Notificação web
Given Estou no menu “Contratos”
And O atleta “Deco” está cadastrado no sistema
When O contrato de “Deco” está a exato “6 meses” de expirar
Then Aparece a mensagem de alerta “O contrado de Deco está a 6 meses do término”
