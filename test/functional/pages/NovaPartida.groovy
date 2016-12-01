package pages

import ga.Partida

import geb.Page
import steps.InternationalizationHelper


class NovaPartida extends Page {

	static url = "/GA/partida/nova"

	static at = {
        InternationalizationHelper helper = InternationalizationHelper.instance

        String pageTitle = helper.getMessage("main.title")
        String subTitle =  helper.getMessage("partida.nova.title")
        title == (pageTitle + " | " + subTitle)
    }

    boolean minimoEscalados() {
        InternationalizationHelper helper = InternationalizationHelper.instance
    	String mensagem = helper.getMessage("partida.nova.atleastoneplayer", Partida.jogadoresMin)
    	def error = $("div.alert.alert-danger").text()
    	return error?.contains(mensagem)
    }

    boolean cadastroComSucesso() {
		InternationalizationHelper helper = InternationalizationHelper.instance
    	String mensagem = helper.getMessage("partida.nova.success")
    	def success = $("div.alert.alert-success").text()
    	return success?.contains(mensagem)
    }
}