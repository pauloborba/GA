import steps.*
import steps.pages.*
import static cucumber.api.groovy.EN.*

Given(~'^o cpf "([^"]*)" está cadastrado no sistema$') {
  String cpf -> AtletaTestAndDataOperations.createAtleta(null, cpf, null)
  assert AtletaTestAndDataOperations.findByCpf(cpf) != null
}

When(~'^é feita uma busca pelo atleta de cpf "([^"]*)"$') {
  String cpf ->
      AtletaTestAndDataOperations.searchAtleta(cpf)

}

Then(~'^É retornado informações existentes do atleta de cpf "([^"]*)"$') { String cpf ->
  assert AtletaTestAndDataOperations.getInfo(cpf) != null
}

Given(~'^estou no menu de atletas$') { String cpf ->
    to page.AtletasPage
    at page.AtletasPage
}

And(~'^existe atleta com cpf "([^"]*)"$') { String cpf ->
    to page.CreateAtleta
    at page.CreateAtleta
    page.CreateAtleta.cadastrarAtleta(null, cpf)
    to page.AtletasPage
}


When(~'^é feita uma busca pelo cpf "([^"]*)"$') { String cpf ->
    at page.AtletasPage
    page.AtletasPage.buscarAtletaCpf(cpf).select()
}

Then(~'^Aparece na tela o atleta de cpf "([^"]*)"$') { String cpf->
    at page.AtletasPage
	assert page.AtletasPage.temAtleta(cpf)
}
