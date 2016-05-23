package gaatleta
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class AtletaController {

    static allowedMethods = [update: "PUT", delete: "DELETE"]
    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [vagaInstanceList: Vaga.list(params),
         vagaInstanceTotal: Vaga.count()]
    }

    def overview(Integer max) {
        list(max)
    }

    def create() {
        respond new Atleta(params)       //  [vagaInstance: new Vaga(params)]
    }

    @Transactional
    def save() {
        def atletaInstance = new Atleta(params)
        if (!atletaInstance.save(flush: true)) {
            render(view: "create", model: [atletaInstance: atletaInstance])
            return
        }
        flash.message = message(code: 'default.created.message', args: [message(code: 'atleta.label', default: 'Atleta'), atletaInstance.id])
        redirect(action: "show", id: atletaInstance.id)
    }

    @Transactional
    def delete(Atleta atletaInstance) {

        if (atletaInstance == null) {
            notFound()
            return
        }

        atletaInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Atleta.label', default: 'Atleta'), atletaInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }
}
