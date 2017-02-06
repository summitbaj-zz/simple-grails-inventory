<g:render template="/layouts/header"/>
<g:form action="update" method="post" id="${item.id}">
    <table>
        <tr>
            <td>Title</td>
            <td><g:textField name="title" value="${item.title}" /></td>
        </tr>
        <tr>
            <td>Description</td>
            <td><g:textArea name="description" value="${item.description}" /> </td>
        </tr>
        <tr>
            <td>Price</td>
            <td><g:textField name="price" value="${item.price}" /></td>
        </tr>
        <tr>
            <td>Category</td>
            <td><g:select multiple="true" name="category" from="${category}"  optionKey="id" optionValue="title"
                          noSelection="['null':'Select a category']"></g:select></td>
        </tr>
        <tr>
            <td colspan="2"><g:actionSubmit value="Update" /></td>
        </tr>
    </table>
</g:form>
<g:render template="/layouts/footer" />