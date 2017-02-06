<g:render template="/layouts/header"/>
<g:form action="update" method="post" id="${category.id}">
    <table>
        <tr>
            <td>Title</td>
            <td><g:textField name="title" value="${category.title}" /></td>
        </tr>
        <tr>
            <td>Description</td>
            <td><input type="text" name="description" value="${category.description}"> </td>
        </tr>
        <tr>
            <td>Parent Category</td>
            <td><g:select name="parent" from="${parent}"  optionKey="id" optionValue="title"
                          noSelection="['null':'Select a Resource']"></g:select></td>
        </tr>

        <tr>
            <td colspan="2"><g:actionSubmit value="Update" /></td>
        </tr>
    </table>
</g:form>
<g:render template="/layouts/footer" />