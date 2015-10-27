package pages

import geb.Page

class CreateContratoPage extends Page{
    def titulo = "Create Contrato"
    static url = "/GA/contrato/create"


    static at  = {
        title ==~ titulo
    }

    def  fillContratoDetails(String contratante, String contratado,String datainicio,String datatermino,String valor){
        $("form").contratante = contratante
        $("form").contratado = contratado
        $("form").data_inicio = datainicio
        $("form").data_termino = datatermino
        $("form").valor = valor


    }

    def selectCreateContrato(){
        $("input", name:"create").click()
    }
}
