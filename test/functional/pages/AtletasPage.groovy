package pages

import geb.Page

/**
 * Created by vrm on 05/11/16.
 */
class AtletasPage extends Page{
    static url = "/GA/jogador/index"

    static at = {
        title ==~ /"Jogador" List/
    }

    boolean selecionarAtleta(cpfAtleta){
        $("a",text: cpfAtleta).click()
    }

    boolean procurarAtleta(cpfAtleta){
        return $("a",text: cpfAtleta)
    }

}
