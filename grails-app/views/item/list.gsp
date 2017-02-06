<g:render template="/layouts/header"/>
<table>
    <tr>
        <th>Title</th>
        <th>Description</th>
        <th>Action</th>
    </tr>
    <g:each in="${items}" var="item">
        <tr>
            <td>${item.title}</td>
            <td>${item.description}</td>
            <td><g:link action="delete" id="${item.id}" >Delete</g:link> | <g:link action="edit" id="${item.id}">Edit</g:link> </td>
        </tr>
    </g:each>
</table>
<g:render template="/layouts/footer" />