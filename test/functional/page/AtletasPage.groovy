package page

import geb.Page

class AtletasPage extends Page {
	static url = "/GA/atleta/overview/"

	static at = {
		title ==~ "Lista de Atletas"
	}

	boolean atletaNaLista(String nome, String cpf) {
		$("td", text: nome).has("a",text: cpf)
	}

	boolean buscarAtletaNome(String nome){
		$("form").nome = nome
		$("input", name: "search").click()
	}

	boolean buscarAtletaCpf(String cpf){
		$("form").cpf = cpf
		$("input", cpf: "search").click()
	}

	def removerAtleta(String cpf){
		$("fomr").cpf = cpf
		$("input", name: "delete").click()
	}

	boolean temAtleta(cpf){
		$("div", class: "cpf").has("h1",text: cpf)
	}
}