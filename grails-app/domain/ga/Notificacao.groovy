package ga

class Notificacao {

	String assunto
	String descricao
	String link
	Date data_notificacao
	boolean lida

	static hasMany = [usuarios: Usuario]
	static hasOne = [jogador: Jogador]

	public static double limiarSalario = 100000.00

	public Notificacao(String assunto, String descricao){
		this.assunto = assunto
		this.descricao = descricao
		lida = false
		data_notificacao = new Date(System.currentTimeMillis())
		link = "#"
	}

	// utilizado para enviar a notificação para o email de todos os usuários cadastrados para receber esta notificação
	public void enviarNotificacao(){
		lida = true
		usuarios.each { users ->
			users.sendCriterion(descricao,assunto)
		}
	}
}