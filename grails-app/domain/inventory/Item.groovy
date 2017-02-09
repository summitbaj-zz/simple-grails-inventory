package inventory

class Item {
    static auditable = true
    static hasMany = [category: Category]
    static belongsTo = Category
    static constraints = {
        title(blank: false)
        description(blank: false)
        price(blank: false)
        category()
    }
    String title
    String description
    Integer price
}
