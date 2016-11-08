package pages

import geb.Page

class AtletaShow extends Page {
    static url = "/GA/jogador/show/"

    static at =  {
        title ==~ /Show "Jogador"/
    }

    def desativarAtleta(){
        $("input", name: "_action_desative").click()
    }

    def removerAtleta(){
        $("input", name: "_action_delete").click()
    }

    def atletaEditavel(){
        return $("input", name: "edit")
    }

}