Feature: Adicionar Atleta
As a Usuário do sistema
I want Adicionar um atleta
So that Ter o cadastro do atleta no sistema

Scenario: Adicionar Atleta no sistema com sucesso web
Given Estou no menu de Atletas
And O atleta de CPF “01234567890” não esta na lista de atletas
When Eu tento cadastrar o atleta “Pedro” com o CPF “01234567890”
Then Eu posso ver a tela de visualização de atleta e o nome “Pedro” e CPF “01234567890”

Scenario: Adicionar Atleta no sistema com sucesso
Given O atleta de CPF “01234567890” não está cadastrado no sistema
When Eu cadastro o atleta de CPF “0123456789”
Then O sistema adiciona o atleta com sucesso
