package ga

class Jogador {
    String nome
    String cpf
    String posicao
    int golsFeitos
    Date dataDeNascimento
    static hasMany = [contratos: Contrato]
    boolean ativo

    Jogador() {
        ativo = true
        golsFeitos = 0
        //contratos = []
    }

    static constraints = {
        nome blank: false, nullable: false
        cpf blank: false, unique: true
        dataDeNascimento blank: true
        posicao inList: ["goleiro", "atacante", "centro"]
    }

//    static mapping = {
//        golsFeitos defaultValue: 0
//        ativo defaultValue: true
//    }

    def addContrato(Contrato contrato, ContratoController controlador) {
        boolean contratoativo = false
        this.contratos.each { it ->
            contratoativo = contratoativo || ( (new Date() <= it.termino) && (it.valido) )
        }
        if(!contratoativo) {
            controlador.save(contrato)
            this.addToContratos(contrato)
        }
    }
}

