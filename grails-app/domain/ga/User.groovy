package ga

class User {

    long id;
    long version;

    String login;
    String senha;

    String toString(){
        "$login"
    }
    static constraints = {
        login nullable:false, blank:false, unique:true
        senha nullable:false,blank:false
    }
}

