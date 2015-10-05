import ga.ControleAcesso
import pages.LoginPage;

import static cucumber.api.groovy.EN.*

this.metaClass.mixin(cucumber.api.groovy.Hooks)
this.metaClass.mixin(cucumber.api.groovy.EN)

Given(~'^estou na pagina de login$'){->
    at LoginPage;
}

When(~'^eu aperto entrar apos preencher o campo de login e senha com "([^"]*)" e "([^"]*)" respectivamente$'){String login,senha ->
    page.fillLoginData(login,senha)
}

Then(~'^eu permaneco na pagina de login com uma mensagem de erro$'){ ->
    at LoginPage
    assert ( page.readFlashMessage() != null );

}

Given(~'^que o login "([^"]*)" nao esta cadastrado no sistema$'){String login ->
    user = ControleAcesso.findByLogin(login)
    assert user == null
}

When(~'^eu tento acessar o sistema com o login "([^"]*)" e senha "([^"]*)"$'){ String login,senha ->
    page.fillLoginData(login, senha);
}

Then(~'^eu nao consigo acessar o gerenciador de atletas$'){->
    at LoginPage;

}