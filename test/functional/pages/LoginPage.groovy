/**
 * Created by ess on 04/10/15.
 */

package pages
import geb.Page

class LoginPage extends Page {
    def titulo = "User Login"
    static url = "/GA/user/login"

    static at = {
        title ==~ titulo
    }

    def fillLoginData(String username, String password) {
        $("form").login = username
        $("form").senha = password
    }

    def selectLogin() {
        $("input",name:"Login").click()
    }
}