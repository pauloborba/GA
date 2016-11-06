package pages

import geb.Page
import steps.InternationalizationHelper

/**
 * Created by jcd2 on 06/11/16.
 */
class CreateUsuario extends Page{

    static url = "/GA/usuario/create"

    static at = {
        InternationalizationHelper helper = InternationalizationHelper.instance

        String usuario = "Usuario"
        String pageTitle = helper.getMessage("default.create.label", usuario)
        title ==~ pageTitle
    }

    def fillField(String nome, String value){
        $("input[name=" + nome + "]").value(value)
    }

    def create(){
        $("input[name='create']").click()
    }

    def messegeError(String email){
        def error = $("div.alert.alert-danger>p").text()

        if(error.contains(email)){
            return true
        }
        return false
    }

    def messegeSuccess(){
        def error = $("div.alert.alert-success").text()

        if(error.contains("created")){
            return true
        }
        return false
    }
}
