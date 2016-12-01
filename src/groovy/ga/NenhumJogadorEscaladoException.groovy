package ga

class NenhumJogadorEscaladoException extends Exception {
	public NenhumJogadorEscaladoException() {
		super("Você deve escalar pelo menos um jogador")
	}
}