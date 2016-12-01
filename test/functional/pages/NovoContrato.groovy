package pages

import geb.Page
import steps.InternationalizationHelper

import ga.Notificacao

class NovoContrato extends Page {

	static url = "/GA/contrato/novo"

	static at = {
        InternationalizationHelper helper = InternationalizationHelper.instance

        String pageTitle = helper.getMessage("main.title")
        String subTitle =  helper.getMessage("contrato.novo.title")
        title == (pageTitle + " | " + subTitle)
    }

    boolean cadastroOk() {
    	InternationalizationHelper helper = InternationalizationHelper.instance
    	String mensagem = helper.getMessage("contrato.novo.success")
    	def success = $("div.alert.alert-success").text()
    	return success?.contains(mensagem)
    }

    boolean warningLimiarSalario(String atleta) {
        InternationalizationHelper helper = InternationalizationHelper.instance
        String mensagem = helper.getMessage("main.notificacoes.salarythreshold", atleta, Notificacao.limiarSalario)
        $('div', id: 'mainnotificacoes').click()
        def limiar = $('div', id: 'mainnotificacoes').find('a', text: mensagem)
        return limiar.text() == mensagem
    }

    boolean conflitoDatas() {
        InternationalizationHelper helper = InternationalizationHelper.instance
        String mensagem = helper.getMessage("contrato.novo.activecontractalreadyexists")
        def erro = $("div.alert.alert-danger").text()
        return erro?.contains(mensagem)
    }
}