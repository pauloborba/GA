package pages

import geb.Page

/**
 * Created by emanuel on 20/05/2016.
 */
class AtletasPage extends Page{
    static url = "/GA/atleta/overview/"

    static at =  {
        title ==~ /Lista de Atletas/
    }

    boolean atletaNaLista(nome, cpf) {
        $("td", text: nome).has("a",text: cpf)
    }

    def selecionarVaga(vaga) {
        $("a",text: vaga).click()
    }
}
