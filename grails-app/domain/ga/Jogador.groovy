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
    boolean ativo

    Jogador() {
    //    contratos = []
    }

    static constraints = {
        nome blank: false, nullable: false
        cpf blank: false, unique: true
        dataDeNascimento blank: true
        posicao inList: ["goleiro", "atacante", "centro"]
    }

    static mapping = {
        golsFeitos defaultValue: 0
        ativo defaultValue: true
    }
}
