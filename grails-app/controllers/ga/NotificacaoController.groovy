package ga

import grails.util.Holders
import org.springframework.context.i18n.LocaleContextHolder
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
                criar_notificação(1,jogador.getNome(),dias)
            }
        }
        redirect action: "index", method: "GET"
    }

    void criar_notificação(int tipo, String jogador, int gols_dias, double bonus=0){
        String subject, descricao
        if(tipo == 1){
            subject ="Notificação de Fim de Contrato"
            descricao = messageSource.getMessage("notificacao.email.contrato",[jogador,gols_dias].toArray(),LocaleContextHolder.getLocale())
        } else {
            subject ="Notificação de Clausula de Gols"
            descricao = messageSource.getMessage("notificacao.email.clausula.gol",[jogador,gols_dias,bonus].toArray(),LocaleContextHolder.getLocale())
        }
        Notificacao notificacao = new Notificacao(subject,descricao)
        notificacao.save()
        Usuario.findAll().each { usuario ->
            if (tipo == 1) {
                if (usuario.contrato_expira) {
                    notificacao.addToUsuarios(usuario)
                }
            } else {
                if(usuario.clausula_gols){
                    notificacao.addToUsuarios(usuario)
                }
            }
        }
        notificacao.enviarNotificacao()
    }

    // utilizado para a verificação se alguma clausula do contrato foi disparada
    def verifica_clausula(){
        Jogador.findAll().each { jogador ->
            jogador.contratos.last().clausulas.each { clausula ->
                if(jogador.getGols()>=clausula.getGols()){
                    criar_notificação(2,jogador.getNome(),jogador.getGols(),clausula.getBonus())
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
