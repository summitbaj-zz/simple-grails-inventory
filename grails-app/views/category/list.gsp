<g:render template="/layouts/header"/>
<table>
    <tr>
        <th>Title</th>
        <th>Description</th>
        <th>Action</th>
    </tr>
    <g:each in="${categories}" var="category">
        <tr>
            <td>${category.title}</td>
            <td>${category.description}</td>
            <td><g:link controller="item" action="cat" id="${category.id}" >Show Products</g:link> |<g:link action="delete" id="${category.id}" >Delete</g:link> | <g:link action="edit" id="${category.id}">Edit</g:link> </td>
        </tr>
    </g:each>
</table>
<g:render template="/layouts/footer" />