package ga

class Contrato {

    Date dataInicio;
    Date dataTermino;
    float salario;
    boolean valido

    static belongsTo = [jogador:Jogador]
    static hasMany = [clausulas:Clausula]


    static constraints = {
        salario nullable: false
        dataInicio nullable: false
        dataTermino nullable: false
    }

    static mapping = {
        valido defaultsValue: true
    }
}
