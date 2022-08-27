<%--
  Created by IntelliJ IDEA.
  User: cungl
  Date: 8/26/2022
  Time: 10:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>



   <a href="/product"><button>Quay lại</button></a>
   <form method="post">
       <pre><h1>Thêm mới sản phẩm</h1></pre>

       <pre>Nhập id        <input type="text" placeholder="Nhập id" name="id"></pre>
       <pre>Nhập tên       <input type="text" placeholder="Nhập tên" name="productName"></pre>
       <pre>Nhập giá       <input type="text" placeholder="Nhập giá" name="price"></pre>
       <pre>Mô tả          <input type="text" placeholder="Nhập mô tả" name="description"></pre>
       <pre>Nhà sản xuất   <input type="text" placeholder="Nhập NSX" name="producer"></pre>

       <input type="submit" value="add">
   </form>
    <c:if test="${message!=null}">

    <p style="text-align:center;color: red">${message}</p>
    </c:if>
</body>
</html>
