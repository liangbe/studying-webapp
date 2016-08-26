<%--
  Created by IntelliJ IDEA.
  User: LIANGBE
  Date: 8/11/2016
  Time: 3:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Title</title>
</head>
<script>

</script>
<body>
<form action="myController" method="GET">
    <input name="name" value="${name}">
   return:${name}
    <input value="提交" type="submit">
</form>
<c:if test="${empty tsList}">
    <div class="h3" role="alert">
        <span >No DATA!</span>
    </div>
</c:if>
<c:if test="${!empty tsList}">
<table border="1">
    <tr><th>No.</th><th>Category</th><th>Code</th><th>Description</th><th>Sequence</th></tr>
    <c:forEach items="${tsList}" var="typeSupp" varStatus="status">
        <tr>
            <td>${ status.index + 1}</td>
            <td>${typeSupp.category}</td>
            <td>${typeSupp.code}</td>
            <td>${typeSupp.description}</td>
            <td>${typeSupp.sequence}</td>
        </tr>
    </c:forEach>
</table>
</c:if>
</body>
</html>
