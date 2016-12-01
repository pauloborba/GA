package ga

import ga.Contrato
import org.springframework.context.i18n.LocaleContextHolder as LCH

class Notificacao {
	String mensagem
	String link
	Date hora
	boolean lida

	static mapping = {
        lida defaultValue: false
    }

    static double limiarSalario = 100000.00

    static def verificaLimiarSalario(Contrato c, String atleta) {
    	if(c.salario > Notificacao.limiarSalario) {
    		def messageSource = grails.util.GrailsWebUtil.currentApplication().mainContext.messageSource
			def msg = messageSource.getMessage("main.notificacoes.salarythreshold", [atleta, Notificacao.limiarSalario].toArray(), LCH.getLocale())
    		def notificacao = new Notificacao([mensagem: msg, link: "#", hora: new Date(), lida: "false"])
    		notificacao.save(flush: true)
    	}
    }
}