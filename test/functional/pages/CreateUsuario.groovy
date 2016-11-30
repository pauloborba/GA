package pages

import geb.Page
import steps.InternationalizationHelper

class CreateUsuario extends Page{

    static url = "/GA/usuario/create"

    static at = {
        InternationalizationHelper helper = InternationalizationHelper.instance

        String usuario = helper.getMessage("usuario.label")
        String pageTitle = helper.getMessage("default.create.label", usuario)
        title ==~ pageTitle
    }

    def fillField(String nome, String value){
        $("input[name=" + nome + "]").value(value)
    }

    def create(){
        $("input[name='create']").click()
    }

    def boolean messegeError(String email){
        def error = $("div.alert.alert-danger>p").text()

        return error?.contains(email)
    }

    def boolean messegeSuccess(){
        def success = $("div.alert.alert-success").text()

        InternationalizationHelper helper = InternationalizationHelper.instance

        String usuario = "Usuario"
        String create = helper.getMessage("default.created.message", usuario)
        return success?.contains(create)
    }
}
