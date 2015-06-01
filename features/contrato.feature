# language: en


Feature: Contrato
As a gerenciador do sistema
I want to criar, editar, remover contratos e inserir e remover cláusulas de um contrato
So that eu posso gerenciar os contratos dos atletas de um clube

Scenario: Adicionar cláusula “Saldo de Gols”
Given que existe um contrato entre contratante “Náutico” e contratada “Miley Cyrus”
And o contrato não possui a cláusula “Saldo de Gols”
When eu adiciono a cláusula “Saldo de Gols”
Then a cláusula “Saldo de Gols” é adicionada ao contrato entre contratante “Náutico” e contratada “Miley Cyrus”
