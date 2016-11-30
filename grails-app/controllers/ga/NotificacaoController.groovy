package ga



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class NotificacaoController {

    static allowedMethods = [/*save: "POST", update: "PUT", delete: "DELETE"*/]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Notificacao.list(params), model:[notificacaoInstanceCount: Notificacao.count()]
    }

    def show(Notificacao notificacaoInstance) {
        respond notificacaoInstance
    }

    @Transactional
    def save(Notificacao notificacaoInstance) {
        if (notificacaoInstance == null) {
            notFound()
            return
        }

        if (notificacaoInstance.hasErrors()) {
            respond notificacaoInstance.errors, view:'create'
            return
        }

        notificacaoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'notificacao.label', default: 'Notificacao'), notificacaoInstance.id])
                redirect notificacaoInstance
            }
            '*' { respond notificacaoInstance, [status: CREATED] }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'notificacao.label', default: 'Notificacao'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
