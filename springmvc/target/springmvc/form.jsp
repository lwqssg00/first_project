<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/22
  Time: 0:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form action="${ctx}/web/request">
        <input type="hidden" name="_method" value="DELETE" >
        <input type="submit" value="提交">
    </form>


    <form action="${ctx}/web/request" method="post">
        <input type="submit" value="提交">
    </form>


</body>
</html>
