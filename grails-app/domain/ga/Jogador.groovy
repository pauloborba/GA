package ga

class Jogador {
    String nome
    String cpf
    String posicao
    Date dataDeNascimento
    int gols
    static hasMany = [contratos: Contrato,notificacaos: Notificacao]
    boolean ativo

    static constraints = {
        nome blank: false, nullable: false
        cpf blank: false, unique: true
        dataDeNascimento blank: true
        posicao inList: ["goleiro", "atacante", "centro", "zagueiro"]
    }

    public Jogador(){
        ativo = true
        gols = 0
    }

    static mapping = {
        contratos cascade: 'all-delete-orphan'
    }
}

