package pages

import geb.Page
import steps.InternationalizationHelper


class EditarJogador extends Page {

    static url = "/GA/jogador/editar"

    static at = {
        InternationalizationHelper helper = InternationalizationHelper.instance

        String pageTitle = helper.getMessage("main.title")
        String subTitle =  helper.getMessage("jogador.editar.title")
        title == (pageTitle + " | " + subTitle)
    }

    def preenche(String nome, String value){
        $("input[name=" + nome + "]").value(value)
    }

    def atualizar() {
    	$("input[name='btnatualizar']").click()
    }

    boolean atletaEditado() {
    	InternationalizationHelper helper = InternationalizationHelper.instance
    	String mensagem = helper.getMessage("jogador.editar.success")
    	def editado = $("div.alert.alert-success").text()
    	return editado?.contains(mensagem)
    }
}