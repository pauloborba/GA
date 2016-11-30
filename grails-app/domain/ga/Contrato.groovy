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

    static mapping = {
        valido defaultsValue: true
    }

    def addClausula(Clausula c) {
        this.addToClausulas(c)
        this.save(flush: true)
    }
}
