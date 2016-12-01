package pages

import geb.Page
import steps.InternationalizationHelper


class NovoJogador extends Page {

	static url = "/GA/jogador/novo"

	static at = {
        InternationalizationHelper helper = InternationalizationHelper.instance

        String pageTitle = helper.getMessage("main.title")
        String subTitle =  helper.getMessage("jogador.novo.title")
        title == (pageTitle + " | " + subTitle)
    }

    boolean cadastroOk() {
    	InternationalizationHelper helper = InternationalizationHelper.instance
    	String mensagem = helper.getMessage("jogador.novo.success")
    	def success = $("div.alert.alert-success").text()
    	return success?.contains(mensagem)
    }

    boolean cpfJaCadastrado() {
    	InternationalizationHelper helper = InternationalizationHelper.instance
    	String mensagem = helper.getMessage("jogador.novo.cpfalreadyregistered")
    	def success = $("div.alert.alert-danger").text()
    	return success?.contains(mensagem)
    }
}