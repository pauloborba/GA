package ga

class Partida {
    
    String adversario;
    int golsSofridos;
    Date data;

    static String mandante = "Ibis"
    static hasMany = [titulares: Jogador , reservas: Jogador, gols: Jogador]
    static jogadoresMin = 1

    static constraints = {
        adversario blank: false, nullable: false
        golsSofridos blank: false, nullable: false, defaultValue: 0
        titulares nullable: true
        reservas nullable: true
        gols nullable: true
    }
}