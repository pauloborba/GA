package ga

class Contrato {
    String nome
    Date inicial
    Date termino
    double salario
    Jogador jogador
    boolean valido

    Contrato(){
        valido = true
    }

    static constraints = {
        nome blank: false, nullable: false, unique: true
        jogador nullable: false
        salario nullable: false
        inicial nullable: true
        termino nullable: true
    }

}
