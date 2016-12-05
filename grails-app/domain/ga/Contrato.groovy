package ga

class Contrato {
    Date inicial
    Date termino
    double salario
    boolean valido
    static hasMany = [clausulas: Clausula]

    static constraints = {
        inicial nullable: false
        termino nullable: false
    }

    public Contrato(){
        valido = true
    }

    // utilizado para pegar a quantidade de dias que falta para o termino do contrato
    public int diasRestantes(){
        return (termino - (new Date(System.currentTimeMillis())))
    }
}
