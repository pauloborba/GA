# language: en


Feature: Contrato
As a gerenciador do sistema
I want to criar, editar, remover contratos e inserir e remover cl�usulas de um contrato
So that eu posso gerenciar os contratos dos atletas de um clube

Scenario: Adicionar cl�usula �Saldo de Gols�
Given que existe um contrato entre contratante �N�utico� e contratada �Miley Cyrus�
And o contrato n�o possui a cl�usula �Saldo de Gols�
When eu adiciono a cl�usula �Saldo de Gols�
Then a cl�usula �Saldo de Gols� � adicionada ao contrato entre contratante �N�utico� e contratada �Miley Cyrus�
