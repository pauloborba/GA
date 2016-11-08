package pages

import geb.Page
import steps.InternationalizationHelper

/**
 * Created by jailson on 07/11/16.
 */
class ListUsuario extends Page{

    static url = "/GA/usuario/index"

    static at = {
        InternationalizationHelper helper = InternationalizationHelper.instance

        String usuario = "Usuario"
        String pageTitle = helper.getMessage("default.list.label", usuario)
        title ==~ pageTitle
    }

    def boolean selectUser(String email){
        def user = null
        $("tr td").each { tag ->
            if(tag.text().contains(email)){
                user = tag.previous()
            }
        }
        return user?.children("a")?.click()
    }
}
