package ga
/**
 * Created by vrm on 22/10/16.
 */
class Jogador {
    String nome
    String cpf
    String posicao
    int golsFeitos
    Date dataDeNascimento
    //static hasMany = [contratos: Contrato]
    boolean ativo = true

    Jogador() {
    //    contratos = []
    }

    static constraints = {
        nome blank: false, nullable: false
        cpf nullable: false, blank: true, unique: true
        dataDeNascimento nullable: true, blank: true
        posicao nullable: true, inList: ["goleiro", "atacante", "centro"]
    }

    static mapping = {
        golsFeitos defaultValue: 0
        ativo defaultValue: true
    }
}
