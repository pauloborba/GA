package pages

import geb.Page

class CreateAtleta extends Page {
    static url = "/GA/atleta/create/"

    static at =  {
        title ==~ /Criar Atleta/
    }

    boolean cadastrAtleta(nome, cpf) {
        if (AtletasPage.existeCPF(cpf)) {
        }
        else{
            $("form").nome = nome
            $("form").cpf = cpf
            /*$("form").dataNascimento = 10/02/1990/ */
            $("input", name: "Criar").click()
        }
    }
}