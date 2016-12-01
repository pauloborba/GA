package ga

import ga.Clausula
import ga.ClausulasEmConflitoException

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

    public Contrato() {
        this.valido = true
    }

    def addClausula(Clausula c) {
      
    }
}
