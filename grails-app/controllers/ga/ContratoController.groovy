package ga



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ContratoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Contrato.list(params), model:[contratoInstanceCount: Contrato.count()]
    }

    def show(Contrato contratoInstance) {
        respond contratoInstance
    }

    def create() {
        respond new Contrato(params)
    }

    public Contrato criarContrato() {
        return new Contrato(params)
    }


    @Transactional
    def save(Contrato contratoInstance) {
        if (contratoInstance == null) {
            notFound()
            return
        }

        if (contratoInstance.hasErrors()) {
            respond contratoInstance.errors, view:'create'
            return
        }

        contratoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'contrato.label', default: 'Contrato'), contratoInstance.id])
                redirect contratoInstance
            }
            '*' { respond contratoInstance, [status: CREATED] }
        }
    }
    public boolean saveContrato(Contrato contrato) {
        contrato.save flush : true
        true
    }


    def edit(Contrato contratoInstance) {
        respond contratoInstance
    }

    @Transactional
    def update(Contrato contratoInstance) {
        if (contratoInstance == null) {
            notFound()
            return
        }

        if (contratoInstance.hasErrors()) {
            respond contratoInstance.errors, view:'edit'
            return
        }

        contratoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Contrato.label', default: 'Contrato'), contratoInstance.id])
                redirect contratoInstance
            }
            '*'{ respond contratoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Contrato contratoInstance) {

        if (contratoInstance == null) {
            notFound()
            return
        }

        contratoInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Contrato.label', default: 'Contrato'), contratoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'contrato.label', default: 'Contrato'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
