package ga



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ClausulaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Clausula.list(params), model:[clausulaInstanceCount: Clausula.count()]
    }

    def show(Clausula clausulaInstance) {
        respond clausulaInstance
    }

    def create() {
        respond new Clausula(params)
    }

    @Transactional
    def save(Clausula clausulaInstance) {
        if (clausulaInstance == null) {
            notFound()
            return
        }

        if (clausulaInstance.hasErrors()) {
            respond clausulaInstance.errors, view:'create'
            return
        }

        clausulaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'clausula.label', default: 'Clausula'), clausulaInstance.id])
                redirect clausulaInstance
            }
            '*' { respond clausulaInstance, [status: CREATED] }
        }
    }

    def edit(Clausula clausulaInstance) {
        respond clausulaInstance
    }

    @Transactional
    def update(Clausula clausulaInstance) {
        if (clausulaInstance == null) {
            notFound()
            return
        }

        if (clausulaInstance.hasErrors()) {
            respond clausulaInstance.errors, view:'edit'
            return
        }

        clausulaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Clausula.label', default: 'Clausula'), clausulaInstance.id])
                redirect clausulaInstance
            }
            '*'{ respond clausulaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Clausula clausulaInstance) {

        if (clausulaInstance == null) {
            notFound()
            return
        }

        clausulaInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Clausula.label', default: 'Clausula'), clausulaInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'clausula.label', default: 'Clausula'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
