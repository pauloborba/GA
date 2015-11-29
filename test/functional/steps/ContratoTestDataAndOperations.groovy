package steps

import ga.ContratoController

class ContratoTestDataAndOperations{

    public static createContrato (String contratante,String contratado,String data_ini,String data_term){

        def controller = new ContratoController()
        controller.params << [contratante: contratante,contratado:contratado,data_inicio:data_ini,
                              data_termino:data_term,valor:1200.00 ]

        controller.request.setContent(new byte[1000])
        controller.saveContrato(controller.criarContrato())
        controller.response.reset()
    }
}

