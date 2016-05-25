package pages

import geb.Page

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
