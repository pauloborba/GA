Feature: Adicionar Atleta
As a: Usuário do sistema
I want: Adicionar um atleta
So that: Ter o cadastro do atleta no sistema


Scenario: Adicionar Atleta Sem sucesso
Given: Quero adicionar um novo atleta no sistema
When: Tento cadastrar um novo atleta com o CPF “863923834-34”
And: O CPF “863923834-34” já se encontra cadastrado no sistema
Then: O sistema não permite o cadastro e emite uma mensagem de erro.

Scenario: Adicionar Atleta Sem sucesso web
Given: Estou no menu “Atletas”
When: Seleciono o opção “Adicionar”
And: Tento cadastrar um novo atleta “Ryan” com o CPF “863923834-34”
And: Na lista de cadastrados já existe um atleta de CPF “863923834-34”
Then: Vejo uma mensagem erro “Este CPF já está cadastrado”

Scenario Adicionar Atleta no sistema com sucesso web
Given Estou no menu de “Atletas”
And O atleta de CPF “01234567890” não esta na lista de atletas
When Eu tento cadastrar o atleta “Pedro” com o CPF “01234567890”
Then Eu posso ver a tela de visualização de atleta e o nome “Pedro” e CPF “01234567890”

Scenario Adicionar Atleta no sistema com sucesso
Given O atleta de CPF “01234567890” não está cadastrado no sistema
When Eu cadastro o atleta de CPF “0123456789”
Then O sistema adiciona o atleta com sucesso
