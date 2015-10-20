package ga

class Contrato {

    String contratado
    String contratante
    String data_inicio
    String data_termino
    double valor

    static constraints = {
        contratado null : false
        contratante null : false
        data_inicio null : false
        data_termino null : false
        valor null : false

    }
}
