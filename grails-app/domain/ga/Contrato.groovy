package ga

class Contrato {
    String numero
    String atletaCpf
    Date dataVencimento

    static constraints = {
        numero blank : false
        atletaCpf blank: false
        atletaCpf unique: true
        dataVencimento nullable: true
    }
}
