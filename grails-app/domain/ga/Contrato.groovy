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

    def addClausula(Clausula c) {
        this.addToClausulas(c)
    }
}
