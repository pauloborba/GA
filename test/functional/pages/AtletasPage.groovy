package pages

import geb.Page

class AtletasPage extends Page {
	static url = "/GA/atleta/overview/"

	static at = {
		title ==~ /Lista de Atletas/
	}
	
	boolean atletaNaLista(nome, cpf) {
        $("td", text: nome).has("a",text: cpf)
    }
}
