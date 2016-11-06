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
        salario nullable: false
        inicial nullable: true
        termino nullable: true

    }

    static mapping = {
        valido defaultsValue: true
    }

}
