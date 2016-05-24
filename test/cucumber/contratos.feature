Feature: Contratos
As a usuario do sistema
I want adicionar e cancelar contratos
So that eu posso gerenciar os contratos dos atletas

Scenario Visualizar histórico de contratos web
Given O atleta “Thiago Aquino” tem ao menos um contrato na base de dados
When O administrador do clube acessar o módulo “visualização de histórico de contratos”
Then O sistema exibe na tela os contratos relacionados ao atleta “Thiago Aquino”

Scenario Visualizar histórico de contratos
Given O atleta “Thiago Aquino” tem ao menos um contrato na base de dados
When O administrador do clube tenta visualizar os contratos do atleta “Thiago Aquino”
Then O sistema busca na base de dados os contratos relacionados ao atleta “Thiago Aquino”
And O sistema não altera os registros da base contigos antes da consulta 

