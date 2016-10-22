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
    Contrato[] contratos

    static constraints = {
        nome blank: false, nullable: false
        cpf blank: false, unique: true
        dataDeNascimento blank: true
        posicao blank: true, unique: ['goleiro', 'atacante', 'centro']
    }

    static mapping = {
        cpf name: 'code'
    }
}
