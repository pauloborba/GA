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
    boolean ativo

    Jogador() {
        golsFeitos = 0
        ativo = true
    }

    static constraints = {
        nome blank: false, nullable: false
        cpf nullable: false, blank: true, unique: true
        dataDeNascimento nullable: true, blank: true
        posicao nullable: true, inList: ["goleiro", "atacante", "centro", "other"]
    }

    def String toString(){
        return nome + ":" + cpf
    }
}
