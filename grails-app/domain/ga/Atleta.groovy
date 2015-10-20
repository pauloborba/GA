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
    boolean alojamentoClube

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
        alojamentoClube null : false
    }
}

