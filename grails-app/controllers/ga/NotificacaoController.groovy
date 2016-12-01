package ga

import grails.util.Holders
import org.springframework.context.i18n.LocaleContextHolder
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class NotificacaoController {

    static allowedMethods = [/*save: "POST", update: "PUT", delete: "DELETE"*/]
    def messageSource = Holders.grailsApplication.mainContext.getBean('messageSource');


    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Notificacao.list(params), model:[notificacaoInstanceCount: Notificacao.count()]
    }

    // utilizado para a verificação se tem algum contrato faltando menos de k dias para terminar
    def verifica_dias_fim(int dias){
        Jogador.findAll().each { jogador ->
            if(jogador.contratos.last().diasRestantes() <= dias) {
                Notificacao notificacao = new Notificacao("Notificação de Fim de Contrato",messageSource.getMessage("notificacao.email.contrato",[jogador.getNome(),dias].toArray(),LocaleContextHolder.getLocale()))
                notificacao.save()
                Usuario.findAll().each { usuario ->
                    if(usuario.contrato_expira) {
                        notificacao.addToUsuarios(usuario)
                    }
                }
                notificacao.enviarNotificacao()
            }
        }
        redirect action: "index", method: "GET"
    }

    // utilizado para a verificação se alguma clausula do contrato foi disparada
    def verifica_clausula(){
        Jogador.findAll().each { jogador ->
            jogador.contratos.last().clausulas.each { clausula ->
                if(jogador.getGols()>=clausula.getGols()){
                    Notificacao notificacao = new Notificacao("Notificação de Clausula de Gols",messageSource.getMessage("notificacao.email.clausula.gol",[jogador.getNome(),gols,clausula.getBonus()].toArray(),LocaleContextHolder.getLocale()))
                    notificacao.save()
                    Usuario.findAll().each {usuario ->
                        if(usuario.clausula_gols){
                            notificacao.addToUsuarios(usuario)
                        }
                    }
                    notificacao.enviarNotificacao()
                }
            }
        }
        redirect action: "index", method: "GET"
    }

    // utilizado para verificar se o salario do jogador foi inserido muito alto e caso tenha sido acima de 100000 lançar uma notificação na plataforma
    def verificaLimiarSalario(Contrato c, String atleta) {
		if(c.salario > Notificacao.limiarSalario) {
			def msg = messageSource.getMessage("main.notificacoes.salarythreshold", [atleta, Notificacao.limiarSalario].toArray(), LocaleContextHolder.getLocale())
			def notificacao = new Notificacao("local", msg)
			notificacao.save(flush: true)
		}
	}
}
