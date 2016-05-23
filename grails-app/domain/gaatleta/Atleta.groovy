package gaatleta

/**
 * Created by efis on 19/05/2016.
 */
class Atleta {
    String nome
    String cpf
    Date dataNascimento

    static constraints = {
        cpf blank: false
        dataNascimento nullable: true
    }
}
