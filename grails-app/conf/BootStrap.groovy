import inventory.SecRole
import inventory.SecUserSecRole
import inventory.User
import myapp.*

class BootStrap {

    def springSecurityService

    def init = { servletContext ->
        def adminRole = new SecRole(authority: 'ROLE_ADMIN').save(flush: true)
        def userRole = new SecRole(authority: 'ROLE_USER').save(flush: true)

        User testUser = new User(username: 'admin', enabled: true, password: 'test', fullName: "Summit", email: "summit@gmail.com",phone: "9801134527")
        testUser.save(flush: true)

        SecUserSecRole.create testUser, adminRole, true

    }

    def destroy = {
    }

}