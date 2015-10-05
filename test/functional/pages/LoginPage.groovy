///**
// * Created by ess on 04/10/15.
// */
//
//package pages
//
//import geb.Page
//
//class LoginPage extends Page {
//    static url = "/GA/auth/login"
//
//    static at = {
//        title == "data:,"
//    }
//
//    static content = {
//        rememberMe { $("form input#rememberMe") }
//        readFlashMessage() { $("div.message").text() }
//        readErrorsMessage() { $("div.errors").text() }
//    }
//
//
//    def getLink(String linkName) { $("div#status a", text: linkName) }
//
//    def submitForm = { $("form input[type='submit']").click() }
//
//
//    def fillLoginDataOnly(String username, String password) {
//        $("form").login = username
//        $("form").password = password
//    }
//
//    def fillLoginData(String l, String p) {
//        fillLoginDataOnly(l, p)
//        $("form").SignIn().click()
//    }
//}