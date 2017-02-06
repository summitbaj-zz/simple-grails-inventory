package inventory

class Category {
    static constraints = {
        title(blank: false)
        description(blank: false)
        //parent()
    }
    String title
    String description
}
