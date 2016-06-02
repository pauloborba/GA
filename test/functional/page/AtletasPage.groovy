package page

import geb.Page

class AtletasPage extends Page {
	static url = "/GA/atleta/overview/"

	static at = {
		title ==~ /Lista de Atletas/
	}
	
		boolean atletaNaLista(nome, cpf) {
        $("td", text: nome).has("a",text: cpf)
    } 

	boolean buscarAtletaNome(nome){
        $("form").nome = nome
        $("input", name: "search").click()
    }

    boolean buscarAtletaCpf(cpf){
        $("form").cpf = cpf
        $("input", cpf: "search").click()
    }

    boolean removerAtleta(cpf){
        $("fomr").cpf = cpf
        $("input", name: "delete").click()
    }

    boolean temAtleta(cpf){
        $("div", class: "cpf").has("h1",text: cpf)
    }
}