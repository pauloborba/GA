package steps

import ga.ContratoController
import ga.Contrato

class ContratoTestDataAndOperations{

    public static createContrato (String contratante,String contratado,String data_ini,String data_term){

        def controller = new ContratoController()
        controller.params << [contratante: contratante,contratado:contratado,data_inicio:data_ini,
                              data_termino:data_term,valor:1200.00 ]

        controller.request.setContent(new byte[1000])
        controller.saveContrato(controller.criarContrato())
        controller.response.reset()
    }


    public static void removeContrato(String contratante, String contratado, String data_Inicio, String data_Termino) {
        def testContrato = Contrato.findWhere(contratado: contratado, contratante: contratante, data_Inicio: data_Inicio, data_Termino: data_Termino)
        def cont = new ContratoController()
        cont.params << [contratado: testContrato.contratado, contratante: testContrato.contratante, data_Inicio: testContrato.dateBegin, data_Termino: testContrato.dateEnd]
        cont.delete()
    }
}
