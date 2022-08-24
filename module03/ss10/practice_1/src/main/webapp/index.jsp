<%--
  Created by IntelliJ IDEA.
  User: cungl
  Date: 8/24/2022
  Time: 11:53 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <form action="/convert" method="get">
    <h1>
      Currency Converter
    </h1>
    <label>Rate:</label>
    <input type="text"  name="rate">
    <label>USD</label>
    <input type="text"  name="usd">

    <button type="submit" value="Converter">Convert</button>
  </form>
  </body>
</html>
