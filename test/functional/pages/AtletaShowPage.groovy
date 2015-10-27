package pages
import geb.Page


class AtletaShowPage extends Page{

    def titulo = "Show Atleta"
    static url = "/GA/atleta/show/1"

    static at = {
        title ==~ titulo
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
