package pages

import geb.Page
/**
 * Created by ess on 05/10/15.
 */

class AtletaPage extends Page{

    def tituloEng = "Atleta List"
    def tituloPt = "Atleta Listagem"

    static url = "/GA/Atleta"

    static at = {
        (title ==~ tituloEng) || (title ==~tituloPt)
    }
}
