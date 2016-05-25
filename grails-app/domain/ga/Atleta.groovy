package ga

class Atleta {
    String nome
    String cpf
    Date dataNascimento

    static constraints = {
        cpf blank: false
        dataNascimento nullable: true
    }
}
