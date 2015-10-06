package ga

class Contrato {

    String contratado
    String contratante
    String data_inicio
    String data_termino
    double valor

    static constraints = {
        contratado unique : true
        contratante unique : true
        data_inicio unique : true
        data_termino unique : true
        valor null : false

    }
}