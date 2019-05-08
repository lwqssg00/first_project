
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${ctx}/static/plugins/layui/css/layui.css" />
    <script src="${ctx}/static/plugins/layui/layui.js"></script>
    <style type="text/css">
        form{
            width: 500px;
            margin: auto;
            margin-top: 10%;
        }
    </style>
</head>
<body>
<form class="layui-form" action="${ctx}/devuser/login" method="post">
    <label>${errorMsg}</label>
    <div class="layui-form-item">
        <label class="layui-form-label">输入框</label>
        <div class="layui-input-inline">
            <input type="text" name="devCode" required  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">密码框</label>
        <div class="layui-input-inline">
            <input type="password" name="devPassword" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
</body>
</html>
