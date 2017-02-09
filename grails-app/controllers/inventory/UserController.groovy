package inventory
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
class UserController {
    static allowedMethods = [save:"POST", update:"POST"]


    def index() {
        redirect(action:  "list", params: params)
    }



    def list(){
        params.max = Math.min(params.max ?
                params.int('max') : 10, 100)
        [users: User.list(params),
         totalUser: User.count()]
    }


    def create(){
        def userInstance = new User()
        [userInstance: userInstance]
    }

    def save = { UserCommand command ->
        if (command.hasErrors()) {
            render (view: "create", model: [content: command])

        }else{
            user.save flush: true, failOnError: true
            redirect action: "show", id: user.id
        }
    }

    def delete ={
        def user = User.get(params.id)
        user.delete flush:true , failOnError: true
        redirect action: "list"
    }

    def show = {
        def user = User.get(params.id)
        [user: user]
    }

    def edit ={

        def userInstance = new User()
        def user = User.get(params.id)
        if(user.id!=session.user.id) {
            redirect(controller: "user", action: "list")
        }
        [userInstance : userInstance, user : user]
    }

    def update = {
        def user = User.get(params.id)
        user.properties = params
        if (user.validate()) {
            user.save flush: true, failOnError: true
            redirect action: "show", id: params.id
        }else{
                flash.message = "Please fill the required field properly";
                redirect( controller: "user", action: "edit",id: user.id)
            }
    }
}


class UserCommand {

    static constraints = {
        fullName(blank: false)
        email(blank: false, email: true)
        password(blank: false, password: true)
        phone(blank: false)

    }

    String fullName
    String email
    String password
    String phone
}