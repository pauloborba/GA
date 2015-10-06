package pages

import geb.Page

class ContratoListPage extends Page {

    static url = "/GA/Contato/list"

    static at =  {
        title ==~ /Contrato List/
    }

    def removeContrato(String contratante, String contratado, String data_Inicio, String data_Termino) {
        //implementar na criação de pagina
    }


}
