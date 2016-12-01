package ga

import org.springframework.context.MessageSource


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.converters.JSON

import ga.Clausula

@Transactional(readOnly = true)
class ContratoController {

    static allowedMethods = [novo: "POST", cadastrar: "GET"]

    def cadastrar() {
        render(view: "index", model: [jogadores: Jogador.findAll("from Jogador j where j.ativo=true") as JSON])
    }

    def novo() {
        Jogador jogador = Jogador.find("from Jogador j where j.cpf=?", [params.txt_cpf])
        def Contrato c = new Contrato();
        c.inicial = Date.parse("dd/MM/yyyy", params.txt_datainicio)
        c.termino = Date.parse("dd/MM/yyyy", params.txt_datafinal)
        c.salario = Double.parseDouble(params.txt_salario)
        c.valido = true
        params.list('clausulas[]').eachWithIndex { it, k  ->
            if(it == "on") {
                c.addClausula(Clausula.find("from Clausula c where c.numero=?", [k + 1]))
            }
        }
        c.save()
        jogador.addContrato(c)
        render(view: "novo", model: [sucesso:true])
    }

    def JaExistecontratoAtivoException (final JaExisteContratoAtivoException exception) {
        String erro = message(code: "contrato.novo.activecontractalreadyexists")
        String errop2 = message(code: "contrato.novo.activecontractalreadyexists2", args: [exception.datafinal])
        render(view: "novo", model: [sucesso:false, erro: erro + " " + errop2])
    }

    def Salvar(Contrato c) {
        c.save(flush: true)
    }
}
