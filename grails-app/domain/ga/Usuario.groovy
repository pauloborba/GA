package ga

class Usuario {
    String nome
    String email
    boolean contrato_expira
    boolean clausula_gols
    int mensagens_enviadas
    def messagingService;

    static belongsTo = [notificacoes:Notificacao]

    static constraints = {
        nome blank: false, nullable: false
        email email: true, unique: true
        notificacoes nullable: true
    }
    public Usuario(){
        mensagens_enviadas = 0
        clausula_gols = false
        contrato_expira = false
    }

    public Usuario(String nome, String email, boolean contrato, boolean clausula){
        this.nome = nome
        this.email = email
        this.contrato_expira = contrato
        this.clausula_gols = clausula
    }

    // utilizado para enviar um email para este usuário
    public void sendCriterion(String mensagem, String assunto){

        messagingService.sendEmail(
                "Gmail",
                "gestaoatletas@gmail.com",
                "ga123456",
                "gestaoatletas@gmail.com",
                this.email,
                assunto,
                mensagem,
        )
        mensagens_enviadas++
    }

}
