<%--
  Created by IntelliJ IDEA.
  User: cungl
  Date: 8/27/2022
  Time: 9:34 AM
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
<form method="post">
        <p>Bạn có muốn xóa sản phẩm này không?</p>
        <table class="table table-success table-striped text-center">

            <tr>
                <th>Tên Sản Phẩm</th>
                <th>Giá</th>
                <th>Mô Tả</th>
                <th>Nhà Sản Xuất</th>
            </tr>

            <tr>
                <td>${product.getProductName()}</td>
                <td>${product.getPrice()}</td>
                <td>${product.getDescription()}</td>
                <td>${product.getProducer()}</td>
            </tr>

        </table>
        <a><button type="submit">Có</button></a>
</form>
        <a href="/product"><button>Quay lại trang chủ</button></a>
</body>
</html>
