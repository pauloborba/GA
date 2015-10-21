package ga

class Partida {

    String numero
    String placar
    String situacao
    String njogcampo
    String njogreserva
    String lastAdminModification

    Date lastUpdated

    def beforeUpdate = {
        lastUpdated = new Date()
    }

    static constraints = {
        numero(nullable: false, blank: false)
        placar(nullable: false, blank: false)
        situacao(nullable: false, blank: false)
        njogcampo(nullable: false, blank: false)
        njogreserva(nullable: false, blank: false)
        lastAdminModification(nullable: false, blank: false)

    }
}
