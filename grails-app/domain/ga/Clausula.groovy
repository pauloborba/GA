package ga

class Clausula {

    int numero;
    int id;
    String descricao;


    static belongsTo = [contrato:Contrato]


    static constraints = {
    }
}
