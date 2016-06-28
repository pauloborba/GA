package pages

import geb.Page

/**
 * Created by emanuel on 20/05/2016.
 */
class VerAtleta extends Page {
    static url = "/GA/atleta/show/"

    static at =  {
        title ==~ /Visualização de Atletas/
    }

    boolean temNome(nome) {
        $("div", class: "nome").has("h1",text: nome)
    }

    boolean temCpf(cpf) {
        $("div", class: "cpf").has("h1",text: cpf)
    }
}
