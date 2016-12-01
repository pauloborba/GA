package ga

class Clausula {
	int numero
	static hasMany = [conflitos: Clausula]
	static mappedBy  = [conflitos: 'conflitos']
	
	static constraints = {
		numero blank: false, unique: true
	}
}