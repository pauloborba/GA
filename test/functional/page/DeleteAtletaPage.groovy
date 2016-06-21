package page

import geb.Page

/**
 * Created by tas4 on 16/06/2016.
 */
class DeleteAtletaPage extends Page{
    def tituloEng = "Delete Atleta"
    def tituloPt = "Criar Atleta"



    static url = "/GA/contrato/delete"

    static at  = {
        (title ==~ tituloPt) || (title ==~ tituloEng)
    }

    def fillAtletaDetails(String nome, String cpf, String data_nascimento) {
        $("form").nome  = nome
        $("form").cpf = cpf
        $("form").data_nascimento = data_nascimento
    }

    def selectDeleteAtleta(){
        $("input", name:"delete").click()
    }
}
