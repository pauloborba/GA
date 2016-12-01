package pages

import geb.Page
import steps.InternationalizationHelper


class ProcurarJogador extends Page {

	static url = "/GA/jogador/procurar"

	static at = {
        InternationalizationHelper helper = InternationalizationHelper.instance

        String pageTitle = helper.getMessage("main.title")
        String subTitle =  helper.getMessage("jogador.procurar.title")
        title == (pageTitle + " | " + subTitle)
    }

    def preenche(String nome, String value){
        $("input[name=" + nome + "]").value(value)
    }

    def procurar(String atleta) {
    	this.preenche("atleta", atleta)
    	$("input[name='btnpesquisar']").click()
    }

    def editarAtleta(String atleta) {
    	InternationalizationHelper helper = InternationalizationHelper.instance
        String editar = helper.getMessage("jogador.procurar.btnedit")
    	$('div', id: 'content').find('td', text: atleta).parent().find('a', text: editar).click()
    }

    def deletarAtleta(String atleta) {
    	InternationalizationHelper helper = InternationalizationHelper.instance
        String remover = helper.getMessage("jogador.procurar.btnremove")
        $('div', id: 'content').find('td', text: atleta).parent().find('a', text: remover).click()
    }
}