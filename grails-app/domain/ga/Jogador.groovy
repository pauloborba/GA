package ga
/**
 * Created by vrm on 22/10/16.
 */

import ga.Contrato
import ga.JaExisteContratoAtivoException

class Jogador {
    String nome
    String cpf
    String posicao
    Date dataDeNascimento
    static hasMany = [contratos: Contrato]
    boolean ativo = true

    static constraints = {
        nome blank: false, nullable: false
        cpf blank: false, unique: true
        dataDeNascimento blank: true
        posicao inList: ["goleiro", "atacante", "centro", "zagueiro"]
    }

    static mapping = {
        contratos cascade: 'all-delete-orphan'
    }

    public Jogador() {
        this.ativo = true
    }

    def addContrato(Contrato contrato) throws JaExisteContratoAtivoException {
        def boolean contratoativo = false
        String datafinal
        this.contratos.each {
            contratoativo = contratoativo || ( (new Date() <= it.termino) && (it.valido == true) )
            if(contratoativo) {
                datafinal = it.termino.format("dd/MM/yyyy")
            }
        }
        if(!contratoativo) {
            this.addToContratos(contrato)
            this.save(flush: true)
            Notificacao.verificaLimiarSalario(contrato, this.nome) //plus de notificação
        } else {
            throw new JaExisteContratoAtivoException(datafinal)
        }
    }
}

