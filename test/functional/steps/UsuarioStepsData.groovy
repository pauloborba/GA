package steps

import ga.Usuario
import ga.UsuarioController

class UsuarioStepsData {

    // utilizado para deletar um usuário utilizado o controller
    static def deleteUser(String email){
        def controller = new UsuarioController()
        controller.delete(Usuario.findByEmail(email))
        controller.response.reset()
        assert Usuario.findByEmail(email) == null
    }

    // utilizado para criar um novo usuário utilizando o controller
    static def createUser(String nome, String email){
        def controller = new UsuarioController()
        Usuario user = new Usuario([nome:nome, email: email, contrato_expira: true, clausula_gols:true])
        controller.save(user)
        controller.response.reset()
        assert Usuario.findByEmail(email) != null
    }
}
