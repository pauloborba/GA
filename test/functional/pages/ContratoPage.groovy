package pages

import geb.Page


    class ContratoPage extends Page{
        def tituloEng = "Contrato List"
        def tituloPt = "Contrato Listagem"
        static url = "/GA/Contrato"

        static at  = {
            (title ==~ tituloEng) || (title ==~tituloPt)
        }


    }

