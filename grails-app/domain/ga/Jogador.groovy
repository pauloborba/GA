package ga

class Jogador {
    String nome
    String cpf
    String posicao
    Date dataDeNascimento
    static hasMany = [contratos: Contrato,notificacaos: Notificacao]
    boolean ativo = true

    static constraints = {
        nome blank: false, nullable: false
        cpf blank: false, unique: true
        dataDeNascimento blank: true
        posicao inList: ["goleiro", "atacante", "centro", "zagueiro"]
    }

    public Jogador(){
        ativo = true
    }

    static mapping = {
        contratos cascade: 'all-delete-orphan'
    }

    def addContrato(Contrato contrato) {
        this.addToContratos(contrato)
        this.save(flush: true)
        Notificacao.verificaLimiarSalario(contrato, this.nome) //plus de notificação
    }
}

