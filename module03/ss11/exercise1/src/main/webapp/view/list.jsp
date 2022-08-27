<%--
  Created by IntelliJ IDEA.
  User: cungl
  Date: 8/26/2022
  Time: 9:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</head>
<body>
<h1>Danh sách về thông tin sản phẩm</h1>
<table class="table table-success table-striped">
    <tr>
        <td>STT</td>
        <td>Tên Sản Phẩm</td>
        <td>Giá</td>
        <td>Mô Tả</td>
        <td>Nhà Sản Xuất</td>
        <td>Chỉnh Sửa</td>
        <td>Xóa</td>
        <td>Xem</td>
    </tr>
    <c:forEach varStatus="status" var="product" items="${product}">
        <tr>
            <td>${status.count}</td>
            <td>${product.getProductName()}</td>
            <td>${product.getPrice()}</td>
            <td>${product.getDescription()}</td>
            <td>${product.getProducer()}</td>
            <td><a href="/product?action=update&id=${product.getId()}"><button class="btn btn-primary">EDIT</button></a></td>
            <td><a href="/product?action=delete&id=${product.getId()}"><button class="btn btn-danger" >DELETE</button></a></td>
            <td><a href="/product?action=display&id=${product.getId()}"><button class="btn btn-success">VIEW</button></a></td>
        </tr>
    </c:forEach>
</table>

    <a style="text-align: center" href="/product?action=add"><button class="btn btn-info">Thêm sản phẩm mới</button></a>


</body>
</html>
