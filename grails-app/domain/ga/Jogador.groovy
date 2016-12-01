package ga

import ga.JaExisteContratoAtivoException

class Jogador {
    String nome
    String cpf
    String posicao
    Date dataDeNascimento
    static hasMany = [contratos: Contrato]
    boolean ativo

    static constraints = {
        nome blank: false, nullable: false
        cpf blank: false, unique: true
        dataDeNascimento blank: true
        posicao inList: ["goleiro", "atacante", "centro", "zagueiro"]
    }

    public Jogador() {
        this.ativo = true
    }

    def verAtivo() throws JaExisteContratoAtivoException {
        this.contratos.each {
            contratoativo = contratoativo || ( (new Date() <= it.termino) && (it.valido == true) )
            if(contratoativo) {
                datafinal = it.termino.format("dd/MM/yyyy")
                throw new JaExisteContratoAtivoException(datafinal)
            }
        }
    }

    def addContrato(Contrato contrato) throws JaExisteContratoAtivoException {
        this.verAtivo()
        this.addToContratos(contrato)
        this.save(flush: true)
    }
}