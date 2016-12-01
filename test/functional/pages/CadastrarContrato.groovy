package pages

import geb.Page
import steps.InternationalizationHelper


class CadastrarContrato extends Page {

    static url = "/GA/contrato/cadastrar"

    static at = {
        InternationalizationHelper helper = InternationalizationHelper.instance

        String pageTitle = helper.getMessage("main.title")
        String subTitle =  helper.getMessage("contrato.cadastrar.title")
        title == (pageTitle + " | " + subTitle)
    }

    def preenche(String nome, String value){
        $("input[name=" + nome + "]").value(value)
    }

    def selecionaAtleta(String atleta) {
        //$("input[name=txt_atleta]") << ARROW_DOWN
        $('div', id: 'listatamfix').find('a', text: atleta).click()
    }

    def cadastrar() {
        $("input[name='btncadastrar']").click()
    }
}