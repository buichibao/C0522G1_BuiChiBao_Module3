<%--
  Created by IntelliJ IDEA.
  User: cungl
  Date: 8/25/2022
  Time: 3:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<body>
<h1>Danh Sách Sản Phẩm</h1>
<form>
    <input type="text" placeholder="Nhập sản phẩm" name="productName">
    <button type="submit" name="action" value="search">Tìm kiếm</button>
</form>


<table class="table table-success table-striped">
    <tr>
        <th>STT</th>
        <th>Tên Sản Phẩm</th>
        <th>Giá</th>
        <th>Mô Tả</th>
        <th>Nhà Sản Xuất</th>
        <th>Chỉnh Sửa</th>
        <th>Xóa</th>
    </tr>
    <c:forEach var="product" varStatus="status" items="${productList}">
        <tr>
            <td>${status.count}</td>
            <td>${product.getProductName()}</td>
            <td>${product.getPrice()}</td>
            <td>${product.getDescription()}</td>
            <td>${product.getProducer()}</td>
            <td><button class="btn btn-primary">Edit</button></td>
            <td><a href="/product?action=delete&id=${product.getId()}"><button class="btn btn-danger">Delete</button></a></td>
        </tr>

    </c:forEach>
</table>
<a href="/product?action=add"><button type="button" class="btn btn-info">Thêm sản phẩm mới</button></a>
</body>
</html>
