package ga

class ClausulasEmConflitoException extends Exception {
	public ClausulasEmConflitoException() {
		super("Duas clausulas inseridas tem conflito entre elas")
	}
}