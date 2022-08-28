<%--
  Created by IntelliJ IDEA.
  User: cungl
  Date: 8/27/2022
  Time: 4:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h3>Chỉnh sửa sản phẩm</h3>
<p>
    <c:if test='${requestScope["message"] != null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</p>
<p>
    <a href="/product" >Về trang quản lí sản phẩm</a>
</p>
<form method="post">
    <fieldset>
        <legend>Thông tin sản phẩm</legend>
        <table>
            <tr>
                <td>Mã sản phẩm: </td>
                <td><input type="number" name="id"  value="${product.getId()}"></td>
            </tr>
            <tr>
                <td>Tên sản phẩm: </td>
                <td><input type="text" name="productName"  value="${product.getProductName()}"></td>
            </tr>
            <tr>
                <td>Giá tiền: </td>
                <td><input type="number" name="price"  value="${product.getPrice()}"></td>
            </tr>
            <tr>
                <td>Mô tả: </td>
                <td><input type="text" name="description" value="${product.getDescription()}"></td>
            </tr>
            <tr>
                <td>Hãng sản xuất: </td>
                <td><input type="text" name="producer"  value="${product.getProducer()}"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Cập nhập"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
