package ga



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class JogadorController {

    static allowedMethods = [/*save: "POST", update: "PUT", delete: "DELETE"*/]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Jogador.list(params), model:[jogadorInstanceCount: Jogador.count()]
    }

    def show(Jogador jogadorInstance) {
        respond jogadorInstance
    }

    def create() {
        respond new Jogador(params)
    }

    @Transactional
    def save(Jogador jogadorInstance) {
        if (jogadorInstance == null) {
            notFound()
            return
        }

        if (jogadorInstance.hasErrors()) {
            respond jogadorInstance.errors, view:'create'
            return
        }

        jogadorInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'jogador.label', default: 'Jogador'), jogadorInstance.id])
                redirect jogadorInstance
            }
            '*' { respond jogadorInstance, [status: CREATED] }
        }
    }

    def edit(Jogador jogadorInstance) {
        respond jogadorInstance
    }

    @Transactional
    def update(Jogador jogadorInstance) {
        if (jogadorInstance == null) {
            notFound()
            return
        }

        if (jogadorInstance.hasErrors()) {
            respond jogadorInstance.errors, view:'edit'
            return
        }

        jogadorInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Jogador.label', default: 'Jogador'), jogadorInstance.id])
                redirect jogadorInstance
            }
            '*'{ respond jogadorInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Jogador jogadorInstance) {

        if (jogadorInstance == null) {
            notFound()
            return
        }

        jogadorInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Jogador.label', default: 'Jogador'), jogadorInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'jogador.label', default: 'Jogador'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
