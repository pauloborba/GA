package pages

import geb.Page
/**
 * Created by ess on 05/10/15.
 */

class AtletaPage extends Page{
    static url = "/Ga/Atleta/index"

    static at = {
        title ==~ /Atleta List/
    }
}