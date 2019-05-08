<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/21
  Time: 22:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <c:forEach items="${orders}" var="obj" >
        <tr>
            <td>${obj.id}</td>
            <td>${obj.address}</td>
            <td>${obj.name}</td>
            <td>${obj.sex}</td>

        </tr>

    </c:forEach>
</body>
</html>
