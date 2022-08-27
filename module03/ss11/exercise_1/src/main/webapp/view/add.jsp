<%--
  Created by IntelliJ IDEA.
  User: cungl
  Date: 8/25/2022
  Time: 3:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Trang them moi</h1>
<a href="/product">Trang list</a>
<c:if test="${mess!=null}">
    <span style="color: red">${mess}</span>
</c:if>
<form action="/product?action=add" method="post">

    <pre> ID          <input type="text" name="id"/></pre>
    <pre>ProductName  <input type="text" name="productName"></pre>
    <pre>Price        <input type="text" name="price"></pre>
    <pre>Description  <input type="text" name="description"></pre>
    <pre>Producer     <input type="text" name="producer"></pre>
    <pre><button>Save</button></pre>
</form>

</body>
</html>
