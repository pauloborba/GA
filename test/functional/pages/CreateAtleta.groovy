package pages

import geb.Page

/**
 * Created by emanuel on 20/05/2016.
 */
class CreateAtleta extends Page {
    static url = "/GA/atleta/create/"

    static at =  {
        title ==~ /Cadastrar Atleta/
    }

    boolean cadastrarAtleta(nome, cpf) {
        $("form").nome = nome
        $("form").cpf = cpf
        $("form").dataNascimento = ""
        $("input", name: "Cadastrar").click()
    }

}
