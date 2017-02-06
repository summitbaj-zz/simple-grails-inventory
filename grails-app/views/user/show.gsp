<g:render template="/layouts/header"/>
<h1>${user.fullName}</h1>
    <table>
        <tr>
            <td>Full Name</td>
            <td>${user.fullName}</td>
        </tr>
        <tr>
            <td>Email</td>
            <td>${user.email}</td>
        </tr>

        <tr>
            <td>phone</td>
            <td>${user.phone}</td>
        </tr>
        <tr>
            <td>role</td>
            <td>${user.role}</td>
        </tr>
    </table>

<g:render template="/layouts/footer" />