package steps

import ga.User
import ga.UserController

class UserTestDataAndOperations {

    static users = [[login: "admim", senha: "senha123"]]


    public static def findUserByLogin(String login) {
        users.find{ users ->
            users.login = login

        }
    }

    static public def logar(String login, String senha){
        def controller = new UserController();
        def user = controller.doLogin({params << [login:'login',senha:'senha']})
        if(user){
            true
        }

    }

//    static public void createMember(String username, String pass) {
//        def cont = new ControleAcessoController()
//        if (pass.equals("")) {
//            cont.params << findByUsername(username)
//        } else {
//            cont.params << [username: username, pass: pass]
//        }
//        cont.create()
//        cont.saveControleAcesso(ControleAcessoController.create())
//        cont.response.reset()
//    }


}