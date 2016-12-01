package ga

class JaExisteContratoAtivoException extends Exception {
	String datafinal

	public JaExisteContratoAtivoException(String data) {
		super("Já existe um contrato ativo para este atleta")
		this.datafinal = data
	}
}