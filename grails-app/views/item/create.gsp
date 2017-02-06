<g:render template="/layouts/header"/>
<g:form action="save" method="post">
    <table>
        <tr>
            <td>Title</td>
            <td><g:textField name="title" /></td>
        </tr>
        <tr>
            <td>Description</td>
            <td><g:textArea name="description" /></td>
        </tr>
        <tr>
            <td>Price</td>
            <td><g:textField name="price" /></td>
        </tr>
        <tr>
            <td>Category</td>
            <td><g:select multiple="true" name="parent" from="${category}"  optionKey="id" optionValue="title"
                          noSelection="['0':'Select a Resource']"></g:select></td>
        </tr>
        <tr>
            <td colspan="2"><g:actionSubmit value="Save" /></td>
        </tr>
    </table>
</g:form>
<g:render template="/layouts/footer" />