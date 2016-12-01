package steps

import pages.ProcurarJogador
import pages.EditarJogador

this.metaClass.mixin(cucumber.api.groovy.Hooks)
this.metaClass.mixin(cucumber.api.groovy.EN)

And(~/^eu estou na página de edição do atleta "([^"]*)"$/) { String atleta ->
	 to ProcurarJogador
	 at ProcurarJogador
	 page.procurar(atleta)
	 page.editarAtleta(atleta)
	 at EditarJogador
}

When(~/^eu mudo o nome do atleta para "([^"]*)"$/) { String atleta ->
	 page.preenche("txt_atleta", atleta)
}

And(~/^eu clico no botão "atualizar"$/) { ->
	 page.atualizar()
}

Then(~/^eu permaneço na página de edição do atleta$/) { ->
	 at EditarJogador
}

And(~/^eu vejo uma mensagem de confirmação de atualização do atleta$/) { ->
	 assert page.atletaEditado()
}
