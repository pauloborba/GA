package pages

import geb.Page
import steps.InternationalizationHelper


class CadastrarPartida extends Page {

    static url = "/GA/partida/cadastro"

    static at = {
        InternationalizationHelper helper = InternationalizationHelper.instance

        String pageTitle = helper.getMessage("main.title")
        String subTitle =  helper.getMessage("partida.cadastrar.title")
        title == (pageTitle + " | " + subTitle)
    }

    def preenche(String nome, String value){
        $("input[name=" + nome + "]").value(value)
    }

    def cadastrar(){
        $("input[name='btncadastrar']").click()
    }

    def marcaTitular(String atleta) {
        $('div', id: 'content').find('td', text: atleta).click()
    }
}