<g:render template="/layouts/header"/>
<h1>Edit a User</h1>
<g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
</g:if>
<g:form action="update" method="post" id="${user.id}">
    <table>
        <tr>
            <td>Full Name</td>
            <td><g:textField name="fullName" value="${user.fullName}" /></td>
        </tr>
        <tr>
            <td>Email</td>
            <td><input type="email" name="email" value="${user.email}"> </td>
        </tr>

        <tr>
            <td>phone</td>
            <td><input type="phone" name="phone" value="${user.phone}"> </td>
        </tr>
        <tr>
            <td>role</td>
            <td><g:select name="role" from="${userInstance.constraints.role.inList}"
                          value="${userInstance?.role}"/></td>
        </tr>
        <tr>
            <td>password</td>
            <td><input type="password" name="password"> </td>
        </tr>
        <tr>
            <td colspan="2"><g:actionSubmit value="Update" /></td>
        </tr>
    </table>
</g:form>
<g:render template="/layouts/footer" />