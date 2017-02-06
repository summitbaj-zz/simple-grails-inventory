<g:render template="/layouts/header"/>
<h1></h1>
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
            <td>Parent Category</td>
            <td><g:select name="parent" from="${parent}"  optionKey="id" optionValue="title"
                          noSelection="['null':'Select a Resource']"></g:select></td>
        </tr>
        <tr>
            <td colspan="2"><g:actionSubmit value="Save" /></td>
        </tr>
    </table>
</g:form>
<g:render template="/layouts/footer" />