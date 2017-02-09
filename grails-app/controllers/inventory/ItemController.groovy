package inventory

import org.hibernate.criterion.CriteriaSpecification

class ItemController {


    static allowedMethods = [save:"POST", update:"POST"]

    def beforeInterceptor = [action:this.&auth]


    def auth() {
        if(!session.user) {
            redirect(controller: "user", action: "login")
            return false
        }
    }

    def index() {
        redirect(action:  "list", params: params)
    }

    def list(){
        params.max = Math.min(params.max ?
                params.int('max') : 10, 100)
        [items: Item.list(params)]
    }


    def cat(){
        def category = Category.get(params.id)
        def CategoryID = params.id
        /*def items = Item.executeQuery("select i from Item i left join i.category c where c.id = ?",Long.valueOf(CategoryID))
        */
        def item = Item.createCriteria()
        def items = item.list {
            createAlias('category', 'c', CriteriaSpecification.LEFT_JOIN)
            eq('c.id', false)
        }
        [items: items,category: category]
    }

    def create(){
        [category: Category.list()]
    }

    def save = {
        def item = new Item(params)
        Set categories = new HashSet()
        categories.add(Category.findById(params.id))
        item.setCategory(categories)
        item.save flush: true, failOnError: true
        redirect action: "show", id: item.id
    }
    def delete ={
        def item = User.get(params.id)
        item.delete flush:true , failOnError: true
        redirect action: "list"
    }

    def show = {
        def item = Item.get(params.id)
        [items: item]
    }

    def edit ={
        def item = Item.get(params.id)
        [category: Category.list(), item : item]
    }

    def update = {
        def item = Item.get(params.id)
        item.properties = params
        item.save flush: true, failOnError: true
        redirect action: "show", id: params.id
    }


}
