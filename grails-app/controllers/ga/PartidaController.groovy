package ga

import org.springframework.context.MessageSource

import ga.Jogador
import ga.Partida
import ga.NenhumJogadorEscaladoException
import ga.PartidasNoMesmoDiaException

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.converters.JSON

@Transactional(readOnly = true)
class PartidaController {

	static allowedMethods = [cadastro: "GET", nova: "POST", teste: "GET"]

	def cadastro() {
		render(view: "cadastro", model: [jogadores: Jogador.findAll("from Jogador j where j.ativo=true") as JSON])
	}

	def nova() {
		Partida nova = new Partida()
		if(params.list('jogadortitular[]').size() == 0) {
			throw new NenhumJogadorEscaladoException()
		}
		nova.adversario = params.txt_adversario
		nova.golsSofridos = params.txt_gols_sofridos.toInteger()
		nova.data = Date.parse("dd/MM/yyyy", params.txt_data)

		params.list('jogadortitular[]').eachWithIndex { it, k  ->
			Jogador jogador = Jogador.find("from Jogador j where j.cpf=?", [it])
			nova.addToTitulares(jogador)
			int gols = params.list('gols[]')[k].toInteger()
			for(i in 0 .. (gols - 1)) {
				nova.addToGols(jogador)
			}
		}

		params.list('jogadorreserva[]').eachWithIndex { it, k  ->
			Jogador jogador = Jogador.find("from Jogador j where j.cpf=?", [it])
			nova.addToReservas(jogador)
		}

		this.salvarPartida(nova)

		render(view: "nova", model:[sucesso: true])
	}

	def NenhumJogadorEscaladoException(final NenhumJogadorEscaladoException exception) {
		render(view: "nova", model:[sucesso: false, erro: message(code: "partida.nova.atleastoneplayer", args: [Partida.jogadoresMin])])
	}

	def salvarPartida(Partida instancia) {
		if(Partida.findByData(instancia.data)) {
			throw new PartidasNoMesmoDiaException()
		}
		instancia.save(flush: true)
	}

	def removerPartida(Partida instancia) {
		instancia.delete(flush: true)
	}
}