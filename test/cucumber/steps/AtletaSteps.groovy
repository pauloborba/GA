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


Given(~/^estou no menu de Atletas$/) { ->
    to AtletaPage
    at AtletaPage
}
Given(~/^o atleta nao aparece na lista de atletas cadastrados$/) { ->
    at AtletaPage
}
When(~/^eu seleciono a opcao "(.*?)"$/) { String opcao ->
    page.select(opcao)
}
When(~/^eu preencho os dados do atleta com nome "(.*?)", email "(.*?)", telefone "(.*?)", data_nascimento "(.*?)", CPF "(.*?)", RG "(.*?)", altura "(.*?)", peso "(.*?)", posicao_joga "(.*?)", categoria "(.*?)" e alojamento_clube "(.*?)"$/) { String nome, String email, String telefone, String data_nascimento, String cpf, String rg, String altura, String peso, String posicao_joga, String categoria, String alojamento_clube ->
    page.fillNome(nome)
    page.fillEmail(email)
    page.fillTelefone(telefone)
    page.fillDataNascimento(data_nascimento)
    page.fillCPF(cpf)
    page.fillRG(rg)
    page.fillAltura(altura)
    page.fillPeso(peso)
    page.fillPosicaoJoga(posicao_joga)
    page.fillCategoria(categoria)
    page.fillAlojamentoClube(alojamento_clube)
}
Then(~/^poderei ver os detalhes do atleta salvo no sistema$/) { ->
    to AtletaPage
    at AtletaPage
}

Given(~'^o sistema possui um atleta com cpf "([^"]*)"$') { String arg1->
    AtletaTestDataAndOperations.createAtleta(arg1)
    atleta = Atleta.findByCpf(arg1)
    assert atleta != null
}
When(~/^eu edito o cpf para "(.*?)"/) { String novoCpf ->
    cpf = novoCpf
    AtletaTestDataAndOperations.editAtletaCpf(cpf, atleta)

}
Then(~'^O sistema deve armazenar o atleta com a nova informacao de cpf no banco de dados$') {->
    assert Atleta.findByCpf(cpf) != null
}

Given(~'^estou na pagina de editar atletas$'){ ->
    to AtletaEditPage
    at AtletaEditPage
}
When(~'^eu preencho o campo de cpf com "([^"]*)"$') {String cpf ->
    page.fillCpfField(cpf)
}
When(~'^eu preencho os campos requeridos corretamente') {->
    page.fillOtherFields()
}
When(~'^envio minhas mudancas') { ->
    page.submitChanges()
}
Then(~'^eu devo ver uma mensagem indicando que as mudancas foram salvas corretamente'){ ->
    to AtletaShowPage
    at AtletaShowPage

    def hasMessage = page.hasMessage()

    assert hasMessage != null
}
