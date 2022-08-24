<%--
  Created by IntelliJ IDEA.
  User: cungl
  Date: 8/24/2022
  Time: 3:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title>Title</title>
</head>
<body>
<h1>Simple Calculator</h1>
<form action="/calculator" method="post">

  <fieldset>
    <legend>Calculator</legend>
    First operand <input type="text" name="firstOperand">
    <br>
    Operator  <select name="opera">
    <option value="+">Addition</option>
    <option value="-">Subtraction</option>
    <option value="*">Multiplication</option>
    <option value="/">Division</option>
  </select>
    <br>
    Second operand <input type="text" name="secondOperand">
    <br>
    <button type="submit">Caculate</button>
  </fieldset>
</form>

</body>
</html>
