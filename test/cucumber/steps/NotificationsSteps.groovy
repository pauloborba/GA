package steps

import cucumber.api.PendingException
import ga.Usuario
import pages.CreateUsuario

this.metaClass.mixin(cucumber.api.groovy.Hooks)
this.metaClass.mixin(cucumber.api.groovy.EN)


//dados incorretos
Given(~/^eu estou na página de adicionar novo usuário para receber notificações$/) {->
    to CreateUsuario
    at CreateUsuario
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
    NotificationsStepsData.deleteUser(email)
}
Then(~/^é exibido uma mensagem de confirmação$/) { ->
    assert page.messegeSuccess()
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
