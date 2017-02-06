package inventory

class User {

    static constraints = {
        fullName(blank: false)
        email(blank: false, email: true)
        password(blank: false, password: true)
        phone(blank: false)
        role(inList: ["admin","manager"])
    }

    static transients = ['admin']
    boolean isAdmin(){
        return role == "admin"
    }

    String fullName
    String email
    String password
    String phone
    String role
}
