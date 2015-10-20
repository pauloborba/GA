package pages

import geb.Page


    class ContratoPage extends Page{
        def titulo = "Contrato Listagem"
        static url = "/GA/Contrato"

        static at  = {
            title ==~ titulo
        }


    }

