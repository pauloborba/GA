package ga

import grails.transaction.Transactional
import grails.converters.JSON

@Transactional(readOnly = true)
class ContratoController {

    static allowedMethods = [/*novo: "POST", cadastrar: "GET"*/]

    def cadastrar() {
        render(view: "index", model: [jogadores: Jogador.findAll("from Jogador j where j.ativo=true") as JSON])
    }

    def novo() {
        Jogador jogador = Jogador.find("from Jogador j where j.cpf=?", [params.txt_cpf])
        def Contrato c = new Contrato();
        c.inicial = Date.parse("dd/MM/yyyy", params.txt_datainicio)
        c.termino = Date.parse("dd/MM/yyyy", params.txt_datafinal)
        c.salario = params.txt_salario as double
        c.valido = true
        c.save()
        jogador.addToContratos(c)
        render(view: "novo", model: [sucesso:true])
    }

    def JaExistecontratoAtivoException (final JaExisteContratoAtivoException exception) {
        String erro = message(code: "contrato.novo.activecontractalreadyexists")
        String errop2 = message(code: "contrato.novo.activecontractalreadyexists2", args: [exception.datafinal])
        render(view: "novo", model: [sucesso:false, erro: erro + " " + errop2])
    }
}