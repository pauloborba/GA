package steps

import cucumber.api.PendingException
import ga.Usuario
import pages.CreateUsuario
import pages.ListUsuario
import pages.ShowUsuario

this.metaClass.mixin(cucumber.api.groovy.Hooks)
this.metaClass.mixin(cucumber.api.groovy.EN)


//dados incorretos
Given(~/^eu estou na página de adicionar novo usuário para receber notificações$/) {->
    toClass(CreateUsuario)
}
When(~/^eu preencho o campo "([^"]*)" com "([^"]*)"$/) { String campo, String valor ->
    page.fillField(campo,valor)
}
And(~/^o campo "([^"]*)" com "([^"]*)"$/) { String campo, String valor ->
    page.fillField(campo,valor)
}
And(~/^eu solicito para adicionar novo usuário para receber notificações$/) { ->
    page.create()
}
Then(~/^eu posso ver uma mensagem informando que o "([^"]*)" é incorreto$/) { String email ->
    assert page.messegeError(email)
}


//Adicionar usuário para receber notificações
And(~/^o usuário "([^"]*)" ainda não está cadastrado para receber notificações com o email "([^"]*)"$/) { String nome, String email ->
    toClass(ListUsuario)
    if(page.selectUser(email)){
        at ShowUsuario
        page.delete()
    }
    toClass(CreateUsuario)
}

def toClass(Object classe) {
    to classe
    at classe
}

Then(~/^é exibido uma mensagem de confirmação$/) { ->
    assert page.messegeSuccess()
}

//usuário já cadastrado para receber notificações
And(~/^o usuário "([^"]*)" já está cadastrado para receber notificações com o email "([^"]*)"$/) { String nome, String email ->
    toClass(ListUsuario)
    if(!page.selectUser(email)){
        toClass(CreateUsuario)
        fillCreate(nome, email)
        page.create()
    }
    toClass(CreateUsuario)
}

def fillCreate(String nome, String email) {
    page.fillField("nome", nome)
    page.fillField("email", email)
}

When(~/^eu adiciono "([^"]*)" nas pessoas que vão receber notificações com o email "([^"]*)"$/) { String nome, String email ->
    fillCreate(nome,email)
    page.create()
}
Then(~/^é exibido uma mensagem de erro dizendo que "([^"]*)" já esta cadastrado para receber notificações com o email "([^"]*)"$/) { String nome, String email ->
    assert page.messegeError(email)
}

//adicionar novo usuário para receber notificações
Given(~/^o sistema não tem o usuário "([^"]*)" cadastrado para receber notificações com o email "([^"]*)"$/) { String usuario, String email ->
    NotificationsStepsData.deleteUser(email)
}
usuarios_email = 0;
When(~/^eu adiciono "([^"]*)" no sistema de notificações com o email "([^"]*)"$/) { String usuario, String email->
    usuarios_email = Usuario.findAll().size()
    NotificationsStepsData.createUser(usuario,email)
}
Then(~/^o usuário "([^"]*)" é adicionado nas pessoas que vão receber as notificações com o email "([^"]*)"$/) { String usuario, String email ->
    assert Usuario.findByNome(usuario) != null
    assert Usuario.findByNome(usuario).email == email
}


//usuário duplicado
Given(~/^o sistema tem o usuário "([^"]*)" cadastrado para receber notificações com o email "([^"]*)"$/) { String nome, String email ->
    NotificationsStepsData.deleteUser(email)
    NotificationsStepsData.createUser(nome,email)
}
Then(~/^o sistema não é modificado$/) { ->
    assert usuarios_email == Usuario.findAll().size()
}

//notificação de fim de contrato
Given(~/^o contrato de "([^"]*)" falta "([^"]*)" dias para seu termino$/) { String arg1, String arg2 ->
    
}
And(~/^o usuário "([^"]*)" está cadastrado para receber notificações com o email "([^"]*)"$/) { String arg1, String arg2 ->
    // Write code here that turns the phrase above into concrete actions
//    throw new PendingException()
}
When(~/^na verificação diária o sistema verifica que o contrato de "([^"]*)" falta "([^"]*)" dias para ser encerrado$/) { String arg1, String arg2 ->
    // Write code here that turns the phrase above into concrete actions
//    throw new PendingException()
}
Then(~/^um email é enviado para "([^"]*)"$/) { String arg1 ->
    // Write code here that turns the phrase above into concrete actions
//    throw new PendingException()
}