package pages

import geb.Page

class AtletaCreate extends Page {
    static url = "/GA/jogador/create/"

    static at =  {
        title ==~ /Create "Jogador"/
    }

    def adicionarAtleta(nome, cpf) {
        $("form").nome = nome
        $("form").cpf = cpf
        $("input", name: "create").click()
    }
}