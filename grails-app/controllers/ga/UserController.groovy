package ga



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class UserController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond User.list(params), model:[UserInstanceCount: User.count()]
    }

    def login = {
    }

    def doLogin = {
        def user = User.findWhere(login:params['login'],senha:params['senha'])
        session.user = user;

        if(user)
            redirect(controller:'user',action:'index')
        else
            redirect(controller:'user',action:'login')
    }

    def show(User UserInstance) {
        respond UserInstance
    }

    def create() {
        respond new User(params)
    }

    public User criarUser(){
        return new User(params)
    }

    @Transactional
    def save(User UserInstance) {
        if (UserInstance == null) {
            notFound()
            return
        }

        if (UserInstance.hasErrors()) {
            respond UserInstance.errors, view:'create'
            return
        }

        UserInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'User.label', default: 'User'), UserInstance.id])
                redirect UserInstance
            }
            '*' { respond UserInstance, [status: CREATED] }
        }
    }

    public boolean saveUser(User user){
        user.save flush : true
        true
    }

    def edit(User UserInstance) {
        respond UserInstance
    }

    @Transactional
    def update(User UserInstance) {
        if (UserInstance == null) {
            notFound()
            return
        }

        if (UserInstance.hasErrors()) {
            respond UserInstance.errors, view:'edit'
            return
        }

        UserInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'User.label', default: 'User'), UserInstance.id])
                redirect UserInstance
            }
            '*'{ respond UserInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(User UserInstance) {

        if (UserInstance == null) {
            notFound()
            return
        }

        UserInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'User.label', default: 'User'), UserInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'User.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
