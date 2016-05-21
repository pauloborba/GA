package page

import geb.Page
/**
 * Created by tas4 on 19/05/2016.
 */

class AtletaPage extends Page {
    static url = "/GA/atleta/"

    static at = {
        title ==~ /Ver Atleta/
    }
}
