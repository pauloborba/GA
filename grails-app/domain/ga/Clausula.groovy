package ga

class Clausula {
    private static final Clausula c1 = new Clausula([numero: 1])
    private static final Clausula c2 = new Clausula([numero: 2])
    int numero
    static hasMany = [conflitos: Clausula]
    static mappedBy  = [conflitos: 'conflitos']

    static constraints = {
        numero blank: false, unique: true
    }
}