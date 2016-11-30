package pages

import geb.Page
import steps.InternationalizationHelper

class ShowUsuario extends Page{

    static url = "/GA/usuario/show"

    static at = {
        InternationalizationHelper helper = InternationalizationHelper.instance

        String usuario = helper.getMessage("usuario.label")
        String pageTitle = helper.getMessage("default.show.label", usuario)
        title ==~ pageTitle
    }

    def delete(){
        $("input[name='_action_delete']").click()
    }
}
