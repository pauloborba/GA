package ga

class Contrato {
    String nome
    Date inicial
    Date termino
    double salario
    Jogador jogador
    boolean valido

    static constraints = {
        nome blank: false, nullable: false
        jogador nullable: false

    }

    static mapping = {
        valido defaultsValue: true
    }

}
