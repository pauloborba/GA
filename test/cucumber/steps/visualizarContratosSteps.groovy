package steps

import ga.AtletaController
import ga.Atleta

this.metaClass.mixin(cucumber.api.groovy.Hooks)
this.metaClass.mixin(cucumber.api.groovy.EN)

//Scenario: Visualizar histórico de contratos web
Given(~'^O atleta "([^"]*)" possui ao menos um contrato na base de dados$') {
}

When(~'^O administrador do clube tenta acessar o módulo visualização de histórico de contratos$') {
}

Then(~'^O sistema exibe na tela a lista dos contratos do atleta "([^"]*)"$') {
}

//Scenario: Visualizar histórico de contratos
Given(~'^O atleta "([^"]*)" tem ao menos um contrato na base de dados$') {
}

When(~'^O administrador tenta visualizar os contratos do atleta "([^"]*)"$') {
}

Then(~'^O sistema busca com sucesso na base de dados os contratos relacionados ao atleta "([^"]*)"$') {
}

And(~'^O sistema não altera os registros da base contidos antes da consulta$') {
}