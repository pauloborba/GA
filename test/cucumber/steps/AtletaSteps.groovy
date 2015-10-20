package steps

import ga.Atleta
import pages.*


this.metaClass.mixin(cucumber.api.groovy.Hooks)
this.metaClass.mixin(cucumber.api.groovy.EN)

/**
 * Created by ess on 02/10/15.
 */

Given(~'^o sistema nao tem o atleta com o CPF "([^"]*)"$') { String arg1 ->
    assert Atleta.findByCpf(arg1) == null
}

When(~'^eu adiciono o atleta com o CPF "([^"]*)"$') { String arg1 ->
    AtletaTestDataAndOperations.createAtleta(arg1)
}

Then(~'^o atleta com o CPF "([^"]*)" esta devidamente armazenado pelo sistema$') { String arg1 ->
    assert Atleta.findByCpf(arg1) != null

}


Given(~'^estou no menu de Atleta$') { ->
    to AtletaPage
    at AtletaPage
}
Given(~'^o atleta nao aparece na lista de atletas cadastrados$') { ->
    at AtletaPage
}

When(~'^eu seleciono a opcao New Atleta$') {  ->
    to CreateAtletaPage
    at CreateAtletaPage
}

When(~'^eu preencho os dados do atleta com nome "([^"]*)", email "([^"]*)", telefone "([^"]*)", CPF "([^"]*)", RG "([^"]*)", altura "([^"]*)", peso "([^"]*)", posicao "([^"]*)", categoria "([^"]*)" e alojamento "([^"]*)"$') { String nome, String email, String telefone, String cpf, String rg, String altura, String peso, String posicao, String categoria, boolean alojamento ->
    at CreateAtletaPage
    page.fillAtletaDetails(nome, email, telefone, cpf, rg, altura, peso, posicao, categoria, alojamento)
}

When(~'^eu seleciono a opcao Create$') { ->
    page.selectCreateAtleta()
}

Then(~'^poderei ver os detalhes do atleta salvo no sistema$') { ->
    to AtletaPage
    at AtletaPage
}



