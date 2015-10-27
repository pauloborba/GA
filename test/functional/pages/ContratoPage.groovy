package pages

import geb.Page


    class ContratoPage extends Page{
        def titulo = "Contrato List"
        static url = "/GA/Contrato"

        static at  = {
            title ==~ titulo
        }


    }

