import ga.User

class BootStrap {

    def init = { servletContext ->
        new User(login:"admin",senha:"senha123").save()
    }
    def destroy = {
    }
}
