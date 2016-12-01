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

    // utilizado para preencher um campo do formulario (email ou nome)
    def fillField(String nome, String value){
        $("input[name=" + nome + "]").value(value)
    }

    // utilizado para clicar no botão de criar usuário
    def create(){
        $("input[name='create']").click()
    }

    // utilizado para verificar se tem o email (email) na mensagem de erro
    def boolean messegeError(String email){
        def error = $("div.alert.alert-danger>p").text()

        return error?.contains(email)
    }

    // utilizado para verificar se tem uma mensagem de sucesso na tela
    def boolean messegeSuccess(){
        def success = $("div.alert.alert-success").text()

        InternationalizationHelper helper = InternationalizationHelper.instance

        String usuario = "Usuario"
        String create = helper.getMessage("default.created.message", usuario)
        return success?.contains(create)
    }
}
