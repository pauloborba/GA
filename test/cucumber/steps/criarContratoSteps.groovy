package steps

import ga.ContratoController
import ga.Contrato

this.metaClass.mixin(cucumber.api.groovy.Hooks)
this.metaClass.mixin(cucumber.api.groovy.EN)

//Scenario: Criar contrato
Given(~'^O atleta de cpf "([^"]*)" não possui contratos cadastrados$') { String cpf ->
    assert Contrato.findByAtletaCpf(cpf) == null
}

When(~'^Eu tento cadastrar um contrato para o atleta de cpf "([^"]*)"$') { String cpf ->
    def contrlador = new ContratoController()
    cadContratoComCpf("00025", cpf, null, contrlador)
}

Then(~'^O sistema cadastra corretamente o contrato para o atleta de cpf "([^"]*)"$') { String cpf ->
    contrato = Contrato.findByAtletaCpf(cpf)
    assert contrato.atletaCpf == cpf
}

def cadContratoComCpf(String numero, String atletaCpf, Date dataVencimento, ContratoController controlador) {
    controlador.params << [atletaCpf: atletaCpf, numero: numero, dataVencimento: dataVencimento]
    controlador.save(new Contrato(atletaCpf: atletaCpf, numero: numero, dataVencimento: dataVencimento))
    controlador.response.reset()
}
//Scenario: Criar contrato sem sucesso
Given(~'^O atleta de cpf "([^"]*)" já possui contratos cadastrados$') { String cpf ->
    def contrlador = new ContratoController()
    cadContratoComCpf("00056", cpf, null, contrlador)
    assert Contrato.findByAtletaCpf(cpf) != null
}

When(~'^Eu tento criar um contrato para o atleta de cpf "([^"]*)"$') { String cpf ->
    def contrlador1 = new ContratoController()
    cadContratoComCpf("000856", cpf, null, contrlador1)
}

Then(~'^O sistema não cadastra o contrato para o atleta de cpf "([^"]*)"$') { String cpf ->
    contratos = Contrato.findAllByAtletaCpf(cpf)
    assert contratos.size()==1
}