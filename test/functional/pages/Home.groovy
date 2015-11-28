package pages

import geb.Page

/**
 * Created by ess on 25/11/15.
 */
class Home extends Page {

    def tituloEng = "User List"
    def tituloPt = "User Listagem"
    static url = "/GA/user/index"

    static at = {
        (title ==~ tituloEng) || (title ==~ tituloPt)
    }
}
