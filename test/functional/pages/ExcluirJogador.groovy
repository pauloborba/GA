package pages

import geb.Page
import steps.InternationalizationHelper


class ExcluirJogador extends Page {

    static url = "/GA/jogador/excluir"

    static at = {
        InternationalizationHelper helper = InternationalizationHelper.instance

        String pageTitle = helper.getMessage("main.title")
        String subTitle =  helper.getMessage("jogador.excluir.title")
        title == (pageTitle + " | " + subTitle)
    }

    boolean jogadorExcluido() {
    	InternationalizationHelper helper = InternationalizationHelper.instance
    	String mensagem = helper.getMessage("jogador.excluir.success")
    	def success = $("div.alert.alert-success").text()
    	return success?.contains(mensagem)
    }
}