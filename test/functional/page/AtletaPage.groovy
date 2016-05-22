package page

import geb.Page
/**
 * Created by tas4 on 19/05/2016.
 */

class AtletaPage extends Page {
    static url = "/GA/atleta/"

    static at = {
        title ==~ /Ver Atleta/
    }
    
    boolean buscarAtletaNome(nome){
        $("form").nome = nome
        $("input", name: "search").click()
    }

    boolean buscarAtletaCpf(cpf){
        $("form").cpf = cpf
        $("input", cpf: "search").click()
    }

    boolean removerAtleta(cpf){
        $("fomr").cpf = cpf
        $("input", name: "delete").click()
    }

    boolean temAtleta(cpf){
        $("div", class: "cpf").has("h1",text: cpf)
    }
}
