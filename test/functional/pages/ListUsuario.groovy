package pages

import geb.Page
import steps.InternationalizationHelper

class ListUsuario extends Page{

    static url = "/GA/usuario/index"

    static at = {
        InternationalizationHelper helper = InternationalizationHelper.instance

        String usuario = helper.getMessage("usuario.label")
        String pageTitle = helper.getMessage("default.list.label", usuario)
        title ==~ pageTitle
    }

    // utilizado para selecionar o usuário com email (email) dentre os varios da lista de usuários
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
