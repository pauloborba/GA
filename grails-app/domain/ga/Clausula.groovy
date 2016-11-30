package ga

class Clausula {

	int numero
	static hasMany = [conflitos: Clausula]
	static mappedBy  = [conflitos: 'conflitos']

	private Clausula() {}
	
	static constraints = {
		numero blank: false, unique: true
	}
}