package pages

import geb.Page
/**
 * Created by ess on 05/10/15.
 */

class AtletaPage extends Page{

    def titulo = "Atleta Listagem"
    static url = "/GA/Atleta"

    static at = {
        title ==~ titulo

    }
}
