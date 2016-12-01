package pages

import geb.Page
import steps.InternationalizationHelper


class CadastrarJogador extends Page {

    static url = "/GA/jogador/cadastro"

    static at = {
        InternationalizationHelper helper = InternationalizationHelper.instance

        String pageTitle = helper.getMessage("main.title")
        String subTitle =  helper.getMessage("jogador.cadastrar.title")
        title == (pageTitle + " | " + subTitle)
    }

    def preenche(String nome, String value){
        $("input[name=" + nome + "]").value(value)
    }

    def seleciona(String nome, String valor) {
    	$('select', name: nome).value(valor)
    }

    def cadastrar(){
        $("input[name='cadastrar']").click()
    }
}