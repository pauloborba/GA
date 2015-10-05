//package ga
//
//
//
//import static org.springframework.http.HttpStatus.*
//import grails.transaction.Transactional
//
//@Transactional(readOnly = true)
//class ControleAcessoController {
//
//    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
//
//    def index(Integer max) {
//        params.max = Math.min(max ?: 10, 100)
//        respond ControleAcesso.list(params), model:[controleAcessoInstanceCount: ControleAcesso.count()]
//    }
//
//    def show(ControleAcesso controleAcessoInstance) {
//        respond controleAcessoInstance
//    }
//
//    def create() {
//        respond new ControleAcesso(params)
//    }
//
//    public ControleAcesso createControle(){
//        return new ControleAcesso(params)
//    }
//
//    public boolean saveControleAcesso(ControleAcesso acesso){
//        acesso.save flush : true
//        true
//    }
//
//    @Transactional
//    def save(ControleAcesso controleAcessoInstance) {
//        if (controleAcessoInstance == null) {
//            notFound()
//            return
//        }
//
//        if (controleAcessoInstance.hasErrors()) {
//            respond controleAcessoInstance.errors, view:'create'
//            return
//        }
//
//        controleAcessoInstance.save flush:true
//
//        request.withFormat {
//            form multipartForm {
//                flash.message = message(code: 'default.created.message', args: [message(code: 'controleAcesso.label', default: 'ControleAcesso'), controleAcessoInstance.id])
//                redirect controleAcessoInstance
//            }
//            '*' { respond controleAcessoInstance, [status: CREATED] }
//        }
//    }
//
//    def edit(ControleAcesso controleAcessoInstance) {
//        respond controleAcessoInstance
//    }
//
//    @Transactional
//    def update(ControleAcesso controleAcessoInstance) {
//        if (controleAcessoInstance == null) {
//            notFound()
//            return
//        }
//
//        if (controleAcessoInstance.hasErrors()) {
//            respond controleAcessoInstance.errors, view:'edit'
//            return
//        }
//
//        controleAcessoInstance.save flush:true
//
//        request.withFormat {
//            form multipartForm {
//                flash.message = message(code: 'default.updated.message', args: [message(code: 'ControleAcesso.label', default: 'ControleAcesso'), controleAcessoInstance.id])
//                redirect controleAcessoInstance
//            }
//            '*'{ respond controleAcessoInstance, [status: OK] }
//        }
//    }
//
//    @Transactional
//    def delete(ControleAcesso controleAcessoInstance) {
//
//        if (controleAcessoInstance == null) {
//            notFound()
//            return
//        }
//
//        controleAcessoInstance.delete flush:true
//
//        request.withFormat {
//            form multipartForm {
//                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ControleAcesso.label', default: 'ControleAcesso'), controleAcessoInstance.id])
//                redirect action:"index", method:"GET"
//            }
//            '*'{ render status: NO_CONTENT }
//        }
//    }
//
//    protected void notFound() {
//        request.withFormat {
//            form multipartForm {
//                flash.message = message(code: 'default.not.found.message', args: [message(code: 'controleAcesso.label', default: 'ControleAcesso'), params.id])
//                redirect action: "index", method: "GET"
//            }
//            '*'{ render status: NOT_FOUND }
//        }
//    }
//}
