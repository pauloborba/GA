import steps.*
import steps.pages.*
import static cucumber.api.groovy.EN.*

Given(~'^ o cpf "([^"]*)" está cadastrado no sistema$') {
  String cpf -> createAtleta(null, cpf, null)
  assert AtletaTestAndDataOperations.findByCpf(cpf) != null
}

When(~'^é feita uma busca pelo atleta de cpf "([^"]*)"$') {
  String cpf ->
      AtletaTestAndDataOperations.searchAtleta(cpf)

}

Then(~'^É retornado informações existentes do atleta de cpf "([^"]*)"$') { String cpf ->
  assert AtletaTestAndDataOperations.getInfo(cpf) != null
}

Given(~'^estou no menu de atletas e existe atleta com cpf "([^"]*)"$') { String cpf ->
    to createAtleta
    at createAtleta
    page.criarAtleta(null, cpf, null)
    to atletaPage
}

When(~'^é feita uma busca pelo cpf "([^"]*)"$') { String cpf ->
    at atletaPage
    page.buscarAtletaCpf(cpf).select()
}

Then(~'^Aparece na tela o atleta de cpf "([^"]*)"$') { String cpf->
    at atletaPage
	assert page.temAtleta(cpf)
}
//criar menuAtletaPage, loginPage, selectBuscarAtletaNome
