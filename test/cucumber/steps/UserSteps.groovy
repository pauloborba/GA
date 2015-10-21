import ga.User
import pages.*
import steps.UserTestDataAndOperations;

import static cucumber.api.groovy.EN.*

this.metaClass.mixin(cucumber.api.groovy.Hooks)
this.metaClass.mixin(cucumber.api.groovy.EN)

Given(~'^estou na pagina de login$'){->
    to LoginPage;
    at LoginPage;
}

When(~'^eu aperto entrar apos preencher o campo de login e senha com "([^"]*)" e "([^"]*)" respectivamente$'){String login, String senha ->
    page.fillLoginData(login,senha);
    page.selectLogin();
}

Then(~'^eu permaneco na pagina de login$'){ ->
    at LoginPage

}

Given(~'^que o login "([^"]*)" nao esta cadastrado no sistema$'){String login ->
    user = User.findByLogin(login)
    assert user == null
}

When(~'^eu tento acessar o sistema com o login "([^"]*)" e senha "([^"]*)"$'){ String login, String  senha ->
    assert UserTestDataAndOperations.logar(login,senha) == null
}

Then(~'^eu nao consigo acessar o gerenciador de atletas$'){->

}