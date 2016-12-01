import ga.Clausula

class BootStrap {

    def init = { servletContext ->
	def c1 = new Clausula([numero: 1])
	def c2 = new Clausula([numero: 2])
	c1.addToConflitos(c2)
	c2.addToConflitos(c1)
	c1.save(flush: true)
	c2.save(flush: true)
    }
    def destroy = {
    }
}
