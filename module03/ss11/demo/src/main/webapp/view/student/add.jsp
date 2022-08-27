<%--
  Created by IntelliJ IDEA.
  User: cungl
  Date: 8/25/2022
  Time: 1:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Trang thêm mới</h1>
<a href="/student">Quay lại danh sách</a>
<c:if test="${mess!=null}">
    <span style="color: red">${mess}</span>
</c:if>
<form action="/student?action=add" method="post">
    <pre>ID:       <input type="text" name="id"/></pre>
    <pre>Name:     <input type="text" name="name"> </pre>
    <pre>Gender :  <input type="radio" name="gender" value="true">Nam <input type="radio" value="false" name="gender"> Nữ </pre>
    <pre>Birthday: <input type="date" name="birthday"> </pre>
    <pre>Point:    <input type="number" name="point"> </pre>
    <pre>Account:  <input type="text" name="account"> </pre>
    <pre>Email:    <input type="text" name="email"> </pre>
    <pre>ClassId:  <select name="classId">
                    <option value="1">C11</option>
                    <option value="2">C12</option>
                    <option value="3">C10</option>
                    </select></pre>
    <pre>           <button>Save</button></pre>
</form>
</body>
</html>
