package ga
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class AtletaController {

    static allowedMethods = [update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Atleta.list(params), model: [atletaInstanceCount: Atleta.count()]
    }

    def show(Atleta atletaInstance) {
        respond atletaInstance
    }

    def create() {
        respond new Atleta(params)
    }

    @Transactional
    def save(Atleta atletaInstance) {
        if (atletaInstance == null) {
            notFound()
            return
        }

        if (atletaInstance.hasErrors()) {
            respond atletaInstance.errors, view: 'create'
            return
        }

        atletaInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'atleta.label', default: 'Atleta'), atletaInstance.id])
                redirect atletaInstance
            }
            '*' { respond atletaInstance, [status: CREATED] }
        }
    }

    def edit(Atleta atletaInstance) {
        respond atletaInstance
    }

    @Transactional
    def update(Atleta atletaInstance) {
        if (atletaInstance == null) {
            notFound()
            return
        }

        if (atletaInstance.hasErrors()) {
            respond atletaInstance.errors, view: 'edit'
            return
        }

        atletaInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Atleta.label', default: 'Atleta'), atletaInstance.id])
                redirect atletaInstance
            }
            '*' { respond atletaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Atleta atletaInstance) {

        if (atletaInstance == null) {
            notFound()
            return
        }

        atletaInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Atleta.label', default: 'Atleta'), atletaInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'atleta.label', default: 'Atleta'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
