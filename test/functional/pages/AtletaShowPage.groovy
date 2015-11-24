package pages
import geb.Page


class AtletaShowPage extends Page{

    def tituloEng = "Show Atleta"
    def tituloPt = "Ver Atleta"
    static url = "/GA/atleta/show/1"

    static at = {
        (title ==~ tituloEng) || (title ==~ tituloPt)
    }

    def boolean hasMessage(){
        def message = $('.message')
        if(!message){
            return false
        } else {
            return true
        }
    }
}
