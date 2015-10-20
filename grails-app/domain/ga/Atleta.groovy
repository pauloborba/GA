package ga

class Atleta {
    String nome
    String email
    String telefone
    String cpf
    String rg
    double altura
    double peso
    String posicao
    String categoria
<<<<<<< HEAD
    boolean alojamentoClube
=======
    boolean alojamento
>>>>>>> d926ac45d106c6b7f31effc90e68d37ac2a3f569

    static constraints = {
        cpf unique : true
        rg null : false
        nome null : false
        email null: false
        telefone null : false
        altura null : false
        peso null : false
        posicao null : false
        categoria null : false
<<<<<<< HEAD
        alojamentoClube null : false
=======
        alojamento null : false
>>>>>>> d926ac45d106c6b7f31effc90e68d37ac2a3f569
    }
}

