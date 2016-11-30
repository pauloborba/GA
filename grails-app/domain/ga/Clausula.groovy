package ga

class Clausula {
	private static final Clausula c1 = new Clausula([numero: 1])
	private static final Clausula c2 = new Clausula([numero: 2])

	int numero
	static hasMany = [conflitos: Clausula]
	static mappedBy  = [conflitos: 'conflitos']

	private Clausula() {}
	
	static constraints = {
		numero blank: false, unique: true
	}

	static synchronized Clausula getClausula(int numero) {
		if(Clausula.findAll().size == 0) {
			c1.save(flush: true)
			c2.save(flush: true)
			saveConflito(c1, c2)

		}
		return Clausula.find("from Clausula c where c.numero=?",[numero])
	}

	static saveConflito(Clausula c1, Clausula c2) {
//		def cl1 = Clausula.find("from Clausula c where c.numero=?",[c1])
//	 	def cl2 = Clausula.find("from Clausula c where c.numero=?",[c2])
//		cl1.addToConflitos(cl2)
//		cl2.addToConflitos(cl1)
//		cl1.save(flush: true)
//		cl2.save(flush: true)
	}
}