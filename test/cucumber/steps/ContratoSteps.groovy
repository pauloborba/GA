package steps
import ga.Contrato
import pages.ContratoListPage
import steps.ContratoTestDataAndOperations

this.metaClass.mixin(cucumber.api.groovy.Hooks)
this.metaClass.mixin(cucumber.api.groovy.EN)

//cenario de cancelamento de contrato(controller)
Given(~'^o sistema tem um contrato com o jogador "([^"]*)" no periodo de "([^"]*)" ate "([^"]*)" no clube "([^"]*)"$') { String name, dateBegin, dateEnd, club->
    ContratoTestDataAndOperations.createContrato(name, club, dateBegin, dateEnd)
    def contrato = Contrato.findWhere(contratado: name, data_inicio: dateBegin, data_termino: dateEnd, contratante: club)
    assert contrato != null
}
When(~'^eu deleto o contrato de jogador "([^"]*)" do periodo de "([^"]*)" ate "([^"]*)" no clube "([^"]*)"$') { String name, dateBegin, dateEnd, club->
    def contrato = Contrato.findWhere(contratado: name, data_inicio: dateBegin, data_termino: dateEnd, contratante: club)
    ContratoTestDataAndOperations.removeContrato(contrato.contratante, contrato.contratado, contrato.data_inicio, contrato.data_termino)
}
Then(~'^o contrato de jogador "([^"]*)" do periodo de "([^"]*)" ate "([^"]*)" e corretamente removido do sistema$') { String name, dateBegin, dateEnd, club ->
    contrato = Contrato.findWhere(contratado: name, data_inicio: dateBegin, data_termino: dateEnd, contratante: club)
    assert contrato == null
}


//cenario de cancelamento de contrato(GUI)

Given(~'^eu estou na pagina de vizualizacao de contratos$') {->
    to ContratoListPage
    at ContratoListPage
}

Given(~'^tem o sistema tem apenas um contrato armazenado com o jogador "([^"]*)" no periodo de "([^"]*)" ate "([^"]*)" no clube "([^"]*)"$') {String name, dateBegin, dateEnd, club->
	contrato = Contrato.findWHere(contratado: name, data_Inicio: dateBegin, data_Termino: dateEnd, contratante: club)
	assert contrato.size() == 1
}

When(~'^eu dou um click para remover o contrato de jogador "([^"]*)" do periodo de "([^"]*)" ate "([^"]*)" no clube "([^"]*)"$') { String name, dateBegin, dateEnd, club ->
	at ContratoListPage
    page.removeContrato(name, club, dateBegin, dateEnd)
}

Then(~'^a mensagem de confirmacao do cancelamento "([^"]*)" e mostrada$') { String status ->
    at ContratoListPage
}