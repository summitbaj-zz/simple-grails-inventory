package inventory

class Item {
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
