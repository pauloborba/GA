package ga

class Jogador {
    String nome;
    int idade;
    float peso;
    float altura;
    String nacionalidade;
    String posicao;
    String cpf;
    String endereco;
    Date dataDeNascimento
    boolean ativo

    static mappedBy = [jogos_titular: 'titulares', jogos_reserva: 'reservas',jogos_gols:'gols']

    static hasMany = [contrato: Contrato, jogos_titular:Jogo, jogos_reserva:Jogo, jogos_gols:Jogo, notificacoes: Notification]

    static constraints = {
        nome blank: false, nullable: false
        cpf nullable: false, blank: true, unique: true
        dataDeNascimento nullable: true, blank: true
        posicao nullable: true, inList: ["goleiro", "atacante", "centro"]
        nacionalidade nullable: false
        endereco nullable: true
        notificacoes nullable: true
        jogos_titular nullable: true
        jogos_gols nullable: true
        jogos_reserva nullable: true
        contrato nullable: false
    }

    static mapping = {
        ativo defaultValue: true
    }
}
