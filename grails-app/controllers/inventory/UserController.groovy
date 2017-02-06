package inventory

class UserController {
    static allowedMethods = [save:"POST", update:"POST"]

    def beforeInterceptor = [action:this.&auth,
                             except:['login', 'logout', 'authenticate']]


    def index() {
        redirect(action:  "list", params: params)
    }

    def auth() {
        if(!session.user) {
            redirect(controller:"user", action:"login")
            return false
        }
        if(!session.user.admin){
            flash.message = "Tsk tsk—admins only"

            beforeInterceptor = [action:this.listRedirect,
                                     only:['create','save','delete']]
            return false
        }
    }

    def listRedirect ={
        redirect(controller: "user", action: "list")
    }

    def logout = {
        flash.message = "Goodbye ${session.user.fullName}"
        session.user = null
        redirect(action:"login")
    }

    def login = {

    }
    def authenticate = {
        def user =
                User.findByEmailAndPassword(params.email, params.password)
        if(user){
            session.user = user
            flash.message = "Hello ${user.fullName}!"
            redirect(controller:"user", action:"list")
        }else{
            flash.message = "Sorry, cannot login with ${params.email} "
            redirect(action:"login")
        }
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

    def save = {
        def user = new User(params)
        if (user.validate()) {
            user.save flush: true, failOnError: true
            redirect action: "show", id: user.id
        }else{
            flash.message = "Please fill the required field properly";
            redirect( controller: "user", action: "create")
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
