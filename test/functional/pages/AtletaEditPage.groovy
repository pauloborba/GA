package pages
import geb.Page
import steps.AtletaTestDataAndOperations

class AtletaEditPage extends Page{

    def tituloEng = "Edit Atleta"
    def tituloPt = "Editar Atleta"
    static url = "/GA/atleta/edit/1"

    static at = {
        (title ==~ tituloEng) || (title ==~tituloPt)
    }

    def fillCpfField(String cpf){
        $("form").cpf = cpf
    }

    def fillOtherFields() {
        AtletaTestDataAndOperations GTDO = new AtletaTestDataAndOperations();
        LinkedHashMap atleta = GTDO.getAtleta();
        $("form").nome = atleta.nome
        $("form").telefone= atleta.telefone
        $("form").email = atleta.email
        $("form").rg = atleta.rg
        $("form").altura = atleta.altura
        $("form").peso = atleta.peso
        $("form").posicao = atleta.posicao
        $("form").categoria = atleta.categoria
        $("form").alojamento = atleta.alojamento

    }

    def submitChanges(){
        $("input", name: "_action_update").click()
    }

    def boolean hasInvalidMessage(){

        def invalidField = $('input:invalid')

        if(invalidField != null){
            return true
        } else {
            return false
        }
    }
}