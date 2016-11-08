package ga

class Jogo {

    String adversario;
    String mandante;
    String placar;
    Date data;
    static belongsTo = [titulares: Jogador, reservas: Jogador, gols: Jogador]

    static constraints = {
    }
}
