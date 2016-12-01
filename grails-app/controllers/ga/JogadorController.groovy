package ga

import org.springframework.context.MessageSource


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class JogadorController {

    static allowedMethods = [cadastro: "GET", novo: "POST", procurar: "GET", excluir: "GET", editar: "GET"]

    def cadastro() {
        render(view: "cadastro", model:[posicoes: Jogador.constraints.posicao.inList])
    }

    def novo() {
        Jogador existe = Jogador.find("From Jogador j where j.cpf=?", [params.txt_cpf])
        if(existe) {
            flash.error = message(code: "jogador.novo.cpfalreadyregistered")
            render(view: "novo", model:[sucesso: false])
        } else {
            Jogador novo = new Jogador()
            novo.nome = params.txt_atleta
            novo.cpf = params.txt_cpf
            novo.posicao = params.select_posicao
            novo.dataDeNascimento = Date.parse("dd/MM/yyyy", params.txt_nascimento)
            this.salvar(novo)
            render(view: "novo", model:[sucesso: true])
        }
    }

    def procurar() {
        if(params.atleta == "") {
            render(view: "procurar", model:[jogadores: Jogador.findAll("from Jogador j where j.ativo=true")])
        } else if(params.atleta == null) {
            render(view: "procurar", model:[jogadores: null])
        }
        else {
            def jogadores = Jogador.withCriteria {
                ilike('nome', params.atleta + '%')
                and {
                    eq("ativo", true)
                }
            }
            render(view: "procurar", model:[jogadores: jogadores])
        }
    }

    def salvar(Jogador jogador) {
        print jogador.nome
        jogador.save(flush: true)
        print "\n_____________________ " + Jogador.findAll()
    }

    def excluir() { //para GUI
        Jogador excluir = Jogador.get(Long.parseLong(params.id))
        excluir.ativo = false
        def contratos = excluir.contratos.findAll()
        contratos.each { contrato ->
            contrato.valido = false
            contrato.save flush:true
        }
        excluir.save(flush: true)
        render(view: "excluir", model:[sucesso: true])
    }



    def desativa(String cpf){ //para controlador
      def jogador = Jogador.findByCpf(cpf)
      if (jogador != null){
        jogador.ativo = false
        def contratos = jogador.contratos.findAll()
        contratos.each { contrato ->                                 //Deixando invalidos
            contrato.valido = false                                  // seus contratos
            contrato.save flush:true
        }
        jogador.save(flush: true)
      }
    }

    def deleta(String cpf){
      def jogador = Jogador.findByCpf(cpf)
      if (jogador != null){
        def semcontratos = true
        def contratos = jogador.contratos.findAll()
        contratos.each { contrato ->                             //Se algum dos contratos está ativo
              semcontratos = semcontratos && !contrato.valido     //o jogador não poderá ser removido
        }

        if (semcontratos) {
            jogador.delete flush:true
        }
      }
    }

    def addContrato(String cpf, Contrato contrato){
      def jogador = Jogador.findByCpf(cpf)
      if (jogador != null){
        try {
          jogador.addContrato(contrato)
          jogador.save flush:true
          true
        } catch(Exception e){
          false
        }
      }
    }

    def editar() {
        Jogador editar = Jogador.get(Long.parseLong(params.id))
        def nascimentoPretty = editar.dataDeNascimento.format('dd/MM/yyyy')
        render(view: "editar", model:[posicoes: Jogador.constraints.posicao.inList, jogador: editar, nascimentoPretty: nascimentoPretty, atualizacao: params.edit])
    }

    def update() {
        Jogador update = Jogador.get(Long.parseLong(params.id))
        update.nome = params.txt_atleta
        update.cpf = params.txt_cpf
        update.posicao = params.select_posicao
        update.dataDeNascimento = Date.parse("dd/MM/yyyy", params.txt_nascimento)
        update.save(flush: true)
        redirect(uri: "/jogador/editar?id=" + params.id + "&edit=true")
    }

}
