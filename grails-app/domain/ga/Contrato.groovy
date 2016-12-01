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
        def conflito = false
        this.clausulas.findAll().each { cl ->
            cl.conflitos.findAll().each {
                if(it.numero == c.numero) {
                    conflito = true
                }
            }
        }
        if(!conflito) {
            this.addToClausulas(c)
        } else {
            throw new ClausulasEmConflitoException()
        }
    }
}
