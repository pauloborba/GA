# language: en

Feature: Contrato
As a gerenciador do sistema
I want to criar, editar, remover contratos e inserir e remover cláusulas de um contrato
So that eu posso gerenciar os contratos dos atletas de um clube

#Controller

Scenario: Criar contrato novo
Given que não existe um contrato entre contratante “Náutico” e contratada “Miley Cyrus”
When eu crio um contrato entre contratante “Náutico” e contratada “Miley Cyrus”
Then o contrato entre contratante “Náutico” e contratada “Miley Cyrus”, é salvo no sistema

Scenario: Remover contrato
Given que existe um contrato entre contratante “Náutico” e contratada “Miley Cyrus”
When eu tento remover o contrato entre contratante “Náutico” e contratada “Miley Cyrus”
Then o contrato entre contratante “Náutico” e contratada “Miley Cyrus” é removido do sistema

Scenario: Editar valor do contrato
Given que existe um contrato entre contratante “Náutico” e contratada “Miley Cyrus”
And o valor do contrato é “R$ 600.00,00”
When eu modifico o valor do contrato para “R$ 1.000.000,00”
Then o contrato entre contratante “Náutico” e contratada “Miley Cyrus” tem seu valor modificado para “R$ 1.000.000,00”

#ERRO

Scenario: Criar contrato duplicado
Given que existe um contrato entre contratante “Náutico” e contratada “Miley Cyrus”
When eu tento criar um contrato entre contratante “Náutico” e contratada “Miley Cyrus”
Then o contrato entre contratante “Náutico” e contratada “Miley Cyrus” não é salvo no sistema

Scenario: Adicionar cláusula duplicada
Given que existe um contrato entre contratante “Náutico” e contratada “Miley Cyrus”
And o contrato possui a cláusula “Saldo de Gols”
When eu tento adicionar a cláusula “Saldo de Gols”
Then a cláusula “Saldo de Gols” não é adicionada ao contrato

#GUI

Scenario: Visualizar contrato web
Given que eu estou na página de contratos
And existe um contrato entre contratante “Náutico” e contratada “Miley Cyrus”
When eu clico no botão “visualizar contrato”
Then todos os atributos do contrato e uma listagem de suas cláusulas são exibidas

Scenario: Listar contratos ordenados por valor web
Given que eu estou na página de contratos
When eu seleciono a opção de listar contratos ordenados por valor
And eu seleciono o botão de “listar contratos”
Then os contratos são listados ordenados pelo seu valor