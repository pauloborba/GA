package ga

class Atleta {
    String nome
    String cpf
    Date dataNascimento

    static constraints = {
		nome blank : false
        cpf blank: false
		cpf unique : true
        dataNascimento nullable: true
    }
}

