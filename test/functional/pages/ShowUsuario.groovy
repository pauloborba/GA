package pages

import geb.Page
import steps.InternationalizationHelper

/**
 * Created by jailson on 07/11/16.
 */
class ShowUsuario extends Page{

    static url = "/GA/usuario/show"

    static at = {
        InternationalizationHelper helper = InternationalizationHelper.instance

        String usuario = "Usuario"
        String pageTitle = helper.getMessage("default.show.label", usuario)
        title ==~ pageTitle
    }

    def delete(){
        $("input[name='_action_delete']").click()
    }
}
