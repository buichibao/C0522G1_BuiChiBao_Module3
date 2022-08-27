<%--
  Created by IntelliJ IDEA.
  User: cungl
  Date: 8/23/2022
  Time: 3:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
    <link href="bootstrap.min.css">
    <link href="bootstrap.min">
  </head>
  <body>
  <form action="/discount" method="get">
    <p>Product Description:</p>
    <input type="text" name="a">
    <p>List Price:</p>
    <input type="text" name="b">
    <p>Discount Percent:</p>
    <input type="text" name="c">
    <button type="submit" class="badge bg-info text-dark">Submit</button>
  </form>
  </body>
</html>
