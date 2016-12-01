package ga

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.converters.JSON

@Transactional(readOnly = true)
class NotificacaoController {

    static allowedMethods = [lidas: "GET", leitura: "GET"]

    def leitura() { //Busca notificações não lidas não lidas
    	render Notificacao.findAll("from Notificacao as n where n.lida=false") as JSON
    }

    def lidas() { //Sinaliza que as notificações foram lidas
    	def query = Notificacao.where {
		    lida == false
		}
		query.updateAll(lida: true)
    	render ""
    }

    def nova(Notificacao notificacao) {
    	notificacao.save()
    }
}