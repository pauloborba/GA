package ga

class Usuario {
    String nome
    String email
    boolean contrato_expira
    boolean clausula_gols
    def messagingService;

    static belongsTo = [notificacoes:Notificacao]

    static constraints = {
        nome blank: false, nullable: false
        email email: true, unique: true
        notificacoes nullable: true
    }

    public void sendCriterion(String mensagem, String assunto){

        messagingService.sendEmail(
                "Gmail",
                "taprojmailer@gmail.com",
                "1234mail",
                "taprojmailer@gmail.com",
                this.email,
                assunto,
                mensagem,
                true,
                null
        )
    }

}
