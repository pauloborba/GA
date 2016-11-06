package pages

import geb.Page

/**
 * Created by vrm on 05/11/16.
 */
class RemocaoPage extends Page{
    static url = "/GA/jogador/show"

    static at = {
        title ==~ "Remocao de Atleta"
    }
}
