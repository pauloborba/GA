//package steps
//
//import ga.ControleAcesso
//import ga.ControleAcessoController
//
///**
// * Created by ess on 04/10/15.
// */
//
//
//class MemberTestDataAndOperations {
//
//    static members = [
//            [name: "Joao", username: "teste", email: "sem@gmail.com",
//             status: "Graduate Student", university: "UFPE", enabled: true
//            ],
//            [name: "Lucas", username: "lucasartu", email: "sem@gmail.com",
//             status: "Graduate Student", university: "UFPE", enabled: true
//            ],
//            [name: "raquel", username: "raquer", email: "sem@gmail.com",
//             status: "Graduate Student", university: "UFPE", enabled: true
//            ]]
//
//
//    static public def findByUsername(String username) {
//        members.find { member ->
//            member.username == username
//        }
//    }
//
//
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
//
//
//}