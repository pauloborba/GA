package ga

import org.springframework.context.i18n.LocaleContextHolder as LCH

class Notificacao {
	String tipo
	String descricao
	String link
	Date data_notificacao
	boolean lida

	static hasMany = [usuarios: Usuario]
	static hasOne = [jogador: Jogador]

	static double limiarSalario = 100000.00

	public Notificacao(String tipo, String descricao){
		this.tipo = tipo
		this.descricao = descricao
		lida = false
		data_notificacao = new Date(System.currentTimeMillis())
	}

	static def verificaLimiarSalario(Contrato c, String atleta) {
		if(c.salario > limiarSalario) {
			def messageSource = grails.util.GrailsWebUtil.currentApplication().mainContext.messageSource
			def msg = messageSource.getMessage("main.notificacoes.salarythreshold", [atleta, limiarSalario].toArray(), LCH.getLocale())
			def notificacao = new Notificacao([mensagem: msg, link: "#", hora: new Date(), lida: "false"])
			notificacao.save(flush: true)
		}
	}
	public void enviarNotificacao(){
		def mensagem = getMessege()
		usuarios.each { users ->
			users.sendCriterion(mensagem,"Contrado Jogador")
		}
	}

	public String getMessege(){
		return "contrato e clausula tudo certo"
	}
}