package ga

class PartidasNoMesmoDiaException extends Exception {
    public PartidasNoMesmoDiaException() {
        super("Já existe uma partida cadastrada para esta data")
    }
}