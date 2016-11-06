package steps

import cucumber.api.PendingException
import ga.Usuario
import ga.UsuarioController

this.metaClass.mixin(cucumber.api.groovy.Hooks)
this.metaClass.mixin(cucumber.api.groovy.EN)

Given(~/^eu estou na página de "([^"]*)" para receber notificações$/) { String arg1 ->
}
When(~/^eu preencho o campo "([^"]*)" com "([^"]*)"$/) { String arg1, String arg2 ->
}
And(~/^o campo "([^"]*)" com "([^"]*)"$/) { String arg1, String arg2 ->
}
And(~/^eu solicito para salvar as alterações feitas em "([^"]*)"$/) { String arg1 ->
}
Then(~/^eu posso ver uma mensagem informando que o "([^"]*)" é incorreto$/) { String arg1 ->
}
And(~/^o usuário "([^"]*)" ainda não está cadastrado para receber notificações$/) { String arg1 ->
}
And(~/^eu escolho confirmar$/) { ->
}
Then(~/^é exibido uma mensagem de confirmação$/) { ->
}
And(~/^o usuário "([^"]*)" já está cadastrado para receber notificações$/) { String arg1 ->
}
When(~/^eu adiciono "([^"]*)" nas pessoas que vão receber notificações$/) { String arg1 ->
}
Then(~/^é exibido uma mensagem de erro dizendo que "([^"]*)" já esta cadastrado para receber notificações$/) { String arg1 ->
}

Given(~/^o sistema não tem o usuário "([^"]*)" cadastrado para receber notificações com o email "([^"]*)"$/) { String usuario, String email ->
    deleteUser(email)
}
usuarios_email = 0;
When(~/^eu adiciono "([^"]*)" no sistema de notificações com o email "([^"]*)"$/) { String usuario, String email->
    usuarios_email = Usuario.findAll().size()
    createUser(usuario,email)
}

static def deleteUser(String email){
    def controller = new UsuarioController()
    controller.delete(Usuario.findByEmail(email))
    assert Usuario.findByEmail(email) == null
}

static def createUser(String nome, String email){
    def controller = new UsuarioController()
    Usuario user = new Usuario([nome:nome,email: email,contrato_expira: true,clausula_gols:true])
    controller.save(user)
    controller.response.reset()
    assert Usuario.findByEmail(email) != null
}

Then(~/^o usuário "([^"]*)" é adicionado nas pessoas que vão receber as notificações com o email "([^"]*)"$/) { String usuario, String email ->

    assert Usuario.findByNome(usuario) != null
    assert Usuario.findByNome(usuario).email == email
}
Given(~/^o sistema tem o usuário "([^"]*)" cadastrado para receber notificações com o email "([^"]*)"$/) { String nome, String email ->
    deleteUser(email)
    createUser(nome,email)
}
Then(~/^o sistema não é modificado$/) { ->
    assert usuarios_email == Usuario.findAll().size()
}
Given(~/^o contrato de "([^"]*)" falta "([^"]*)" dias para seu termino$/) { String arg1, String arg2 ->
}
And(~/^o usuário "([^"]*)" está cadastrado para receber notificações$/) { String arg1 ->
}
When(~/^na verificação diária o sistema verifica que o contrato de "([^"]*)" falta "([^"]*)" dias para ser encerrado$/) { String arg1, String arg2 ->
}
Then(~/^um email é enviado para "([^"]*)"$/) { String arg1 ->
}
And(~/^o usuário "([^"]*)" não está cadastrado para receber notificações de fim de contrato$/) { String arg1 ->
}
Then(~/^não é enviado um email para "([^"]*)"$/) { String arg1 ->
}