<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/22
  Time: 22:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

    <form class="layui-form" method="post" action="${ctx}/session/register">
        <input type="text" name="id"><br>
        <input type="text" name="name"><br>
        <<input type="submit" value="提交">
    </form>
</body>
</html>
