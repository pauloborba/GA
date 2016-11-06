package ga

class Usuario {
    String nome
    String email
    boolean contrato_expira
    boolean clausula_gols

    //static belongsTo = [notificacoes:Notification]

    static constraints = {
        nome blank: false, nullable: false
        email email: true, unique: true
    }
}
