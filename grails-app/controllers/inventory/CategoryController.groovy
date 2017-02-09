package inventory

import grails.plugin.springsecurity.annotation.Secured

class CategoryController {
    static layout = 'main'
    static allowedMethods = [save:"POST", update:"POST"]

    def index() {
        redirect(action:  "list", params: params)
    }

    @Secured(["ROLE_ADMIN"])
    def list(){
        params.max = Math.min(params.max ?
                params.int('max') : 10, 100)
        [categories: Category.list(params)]
    }
    @Secured(["ROLE_ADMIN"])
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
        def category = User.get(params.id)
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
