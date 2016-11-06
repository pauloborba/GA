package ga

class Notification {

    String tipo;
    String descricao;
    Date data_notificacao;
    static hasMany = [usuarios: Usuario]
    static hasOne = [jogador: Jogador]

    static constraints = {
        tipo blank: false, nullable: false, inList: ["fim contrato", "clausula"]
        descricao blank: true
        data_notificacao nullable: false
        jogador nullable: false
        usuarios nullable: false
    }
}
