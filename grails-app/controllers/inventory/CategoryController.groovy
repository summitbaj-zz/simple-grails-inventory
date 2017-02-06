package inventory

class CategoryController {

    static allowedMethods = [save:"POST", update:"POST"]
    def index() {
        redirect(action:  "list", params: params)
    }

    def beforeInterceptor = [action:this.&auth,
                             except:['login', 'logout', 'authenticate']]


    def auth() {
        if(!session.user) {
            redirect(controller:"user", action:"login")
            return false
        }
    }


    def list(){
        params.max = Math.min(params.max ?
                params.int('max') : 10, 100)
        [categories: Category.list(params)]
    }

    def create(){
        [parent: Category.list()]
    }

    def save = {
        def category = new Category(params)
        if (category.validate()) {
            category.save flush: true, failOnError: true
            redirect action: "show", id: category.id
        }else{
            flash.message = "Please check the fields again"
            redirect controller: "category", action: "create"
        }
    }
    def delete ={
        def category = Category.get(params.id)
        category.delete flush:true , failOnError: true
        redirect action: "list"
    }

    def show = {
        def category = Category.get(params.id)
        [categories: category]
    }

    def edit ={
        def category = Category.get(params.id)
        [parent: Category.list(), category : category]
    }

    def update = {
        def category = Category.get(params.id)
        category.properties = params
        if(category.validate()) {
            category.save flush: true, failOnError: true
            redirect action: "show", id: params.id
        }else{
            flash.message = "Please check your field once again"
            redirect controller: "category", action: "edit", id: category.id
        }
    }


}
