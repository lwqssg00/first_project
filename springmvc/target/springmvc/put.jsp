<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/22
  Time: 13:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form action="${ctx}/user/post" method="post">
        <input type="text" name="name"><br>
        <input type="password" name="password"><br>
        <input type="date" name="date"><br>
        <input type="submit" value="提交">
    </form>
</body>
</html>
