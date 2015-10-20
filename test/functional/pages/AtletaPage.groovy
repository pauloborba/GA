package pages

import geb.Page
/**
 * Created by ess on 05/10/15.
 */

class AtletaPage extends Page{
<<<<<<< HEAD
    static url = "/Ga/Atleta/index"

    static at = {
        title ==~ /Atleta List/
=======
    def titulo = "Atleta Listagem"
    static url = "/GA/Atleta"

    static at = {
        title ==~ titulo
>>>>>>> d926ac45d106c6b7f31effc90e68d37ac2a3f569
    }
}