package steps

import ga.Jogador
import ga.NotificacaoController
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
    UsuarioStepsData.deleteUser(email)
}
usuarios_email = 0;
When(~/^eu adiciono "([^"]*)" no sistema de notificações com o email "([^"]*)"$/) { String usuario, String email->
    usuarios_email = Usuario.findAll().size()
    UsuarioStepsData.createUser(usuario,email)
}
Then(~/^o usuário "([^"]*)" é adicionado nas pessoas que vão receber as notificações com o email "([^"]*)"$/) { String usuario, String email ->
    assert Usuario.findByNome(usuario) != null
    assert Usuario.findByNome(usuario).email == email
}


//usuário duplicado
Given(~/^o sistema tem o usuário "([^"]*)" cadastrado para receber notificações com o email "([^"]*)"$/) { String nome, String email ->
    UsuarioStepsData.deleteUser(email)
    UsuarioStepsData.createUser(nome,email)
}
Then(~/^o sistema não é modificado$/) { ->
    assert usuarios_email == Usuario.findAll().size()
}

//notificação de fim de contrato
String cpf_jogador = ""
Given(~/^o contrato de "([^"]*)" e cpf "([^"]*)" falta "([^"]*)" dias para seu termino$/) { String jogador, String cpf, int dias ->
    cpf_jogador = cpf
    JogadorStepsData.createJogador(jogador,cpf,"goleiro",(new Date(System.currentTimeMillis()) - dias*20).format("dd/MM/yyyy"))
    ContratoStepsData.createContrato((new Date(System.currentTimeMillis())-dias*2).format("dd/MM/yyyy"), (new Date(System.currentTimeMillis()) + dias).format("dd/MM/yyyy"),5000.0,cpf)
    assert Jogador.findByCpf(cpf).contratos.last().diasRestantes() == dias
}
int mensagens_enviadas = 0
String usuarios_email = ""
And(~/^o usuário "([^"]*)" está cadastrado para receber notificações com o email "([^"]*)"$/) { String nome, String email ->
    usuarios_email = email
    UsuarioStepsData.createUser(nome, email)
    mensagens_enviadas = Usuario.findByEmail(email).getMensagens_enviadas()
}
When(~/^na verificação diária o sistema verifica que o contrato de "([^"]*)" falta "([^"]*)" dias para ser encerrado$/) { String jogador, int dias ->
    assert Jogador.findByCpf(cpf_jogador).contratos.last().diasRestantes() <= dias
    def controller = new NotificacaoController()
    controller.verifica_dias_fim(dias)
}
Then(~/^um email é enviado para "([^"]*)"$/) { String usuario ->
    assert Usuario.findByEmail(usuarios_email).getMensagens_enviadas() == mensagens_enviadas + 1
}