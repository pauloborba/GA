package page

import geb.Page

/**
 * Created by tas4 on 19/05/2016.
 */

class CreatePage extends Page {
    static url = "/GA/create/"

    static at = {
        title ==~ /Criar Atleta/
    }

    boolean criarAtleta(nome, cpf, data_nascimento, contrato, num_jogados){
        $("form").nome = nome
        $("fomr").cpf = cpf
        $("form").data_nascimento = data_nascimento
        $("form").contrato = contrato
        $("form").num_jogados = num_jogados
        $("input", name: "create").click()
    }
}
