<g:render template="/layouts/header"/>
<h1>Users</h1>
<table>
    <tr>
        <th>Name</th>
        <th>Email</th>
        <th>Phone</th>
        <th>Role</th>
        <g:if test="${session?.user?.admin}"><th>Action</th></g:if>
    </tr>
    <g:each in="${users}" var="user">
        <tr>
            <td>${user.fullName}</td>
            <td>${user.email}</td>
            <td>${user.phone}</td>
            <td>${user.role}</td>
            <g:if test="${session?.user?.admin}"><td><g:link action="delete" id="${user.id}" >Delete</g:link> | <g:link action="edit" id="${user.id}">Edit</g:link> </td></g:if>
    </tr>
    </g:each>
</table>
<g:render template="/layouts/footer" />