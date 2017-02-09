<html>
<head>
    <title>Welcome to Grails</title>
    <meta name="layout" content="main" />
    <!-- CSS styling snipped -->
</head>
<body>
<h1>Create a User</h1>
<g:hasErrors bean="${content}">
    <g:renderErrors bean="${content}" as="list" />
</g:hasErrors>
<form name="form1" action="save" method="post">
    <table>
        <tr>
            <td>Full Name</td>
            <td><input type="text" name="fullName"> </td>
        </tr>
        <tr>
            <td>Email</td>
            <td><input type="email" name="email"> </td>
        </tr>

        <tr>
            <td>phone</td>
            <td><input type="phone" name="phone"> </td>
        </tr>
        <tr>
            <td>role</td>
            <td><select name="role" id="role">
                <option value="admin">admin</option>
                <option value="">manager</option>
            </select> </td>
        </tr>
        <tr>
            <td>password</td>
            <td><input type="password" name="password"> </td>
        </tr>
        <tr>
            <td colspan="2"><input name="submit" type="submit"></td>
        </tr>
    </table>
</form>
</body>
</html>