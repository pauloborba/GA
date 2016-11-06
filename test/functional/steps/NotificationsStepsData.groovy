package steps

import ga.Usuario
import ga.UsuarioController

/**
 * Created by jcd2 on 06/11/16.
 */
class NotificationsStepsData {
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
}
