<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>APP</title>
    <link rel="stylesheet" href="${ctx}/static/plugins/layui/css/layui.css" />
    <script src="${ctx}/static/plugins/layui/layui.js"></script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <jsp:include page="/jsp/common/header.jsp"/>
    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">APP账户管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;">列表一</a></dd>
                        <dd><a href="javascript:;">列表二</a></dd>
                        <dd><a href="javascript:;">列表三</a></dd>
                        <dd><a href="">超链接</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">APP应用管理</a>
                    <dl class="layui-nav-child">
                        <%--<dd><a href="javascript:;">列表一</a></dd>--%>
                        <%--<dd><a href="javascript:;">列表二</a></dd>--%>
                        <dd><a href="${ctx}/index/devId/${sessionScope.devUsers.id}">APP维护</a></dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <fieldset class="layui-elem-field " style="margin-top: 30px;padding: 10px 50px 2px 2px ">
            <legend>app详细信息</legend>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">软件名称</label>
                        <div class="layui-input-inline">
                            <input type="tel" name="softwareName" lay-verify="required|appUsername" autocomplete="off" class="layui-input" value="${app.softwareName}">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">apk名称</label>
                        <div class="layui-input-inline">
                            <input type="tel" name="apkName" lay-verify="required|appUsername" autocomplete="off" class="layui-input" value="${app.apkName}" >
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">APP状态</label>
                        <div class="layui-input-inline">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">支持ROM</label>
                        <div class="layui-input-inline">
                            <input type="tel" name="supportTrom" lay-verify="required|appUsername" autocomplete="off" class="layui-input" value="${app.supportTrom}">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">界面语言</label>
                        <div class="layui-input-inline">
                            <input type="tel" name="interfaceLanguage" lay-verify="required|appUsername" autocomplete="off" class="layui-input" value="${app.interfaceLanguage}" >
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">软件大小</label>
                        <div class="layui-input-inline">
                            <input type="tel" name="softwareSize" lay-verify="required|appUsername" autocomplete="off" class="layui-input" value="${app.softwareSize}">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">版本信息</label>
                        <div class="layui-input-inline">
                            <input type="text" name="newAppVersion.versionNo" lay-verify="required|versionId" autocomplete="off" class="layui-input"  placeholder="如：V.1.1.1" value="${app.newAppVersion.versionNo}">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">app基本信息</label>
                    <div class="layui-input-block">
                        <textarea placeholder="请输入内容" class="layui-textarea" name="appInfo">${app.appInfo}</textarea>
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-input-inline">
                        <input class="layui-btn layui-btn-normal" value="返回" onclick="javascript:history.back(-1)" type="button">
                    </div>
                </div>
        </fieldset>

        <fieldset class="layui-elem-field " style="margin-top: 30px;padding: 10px 50px 2px 2px ">

            <legend>app历史版本信息</legend>

            <table class="layui-table">
                <thead>
                    <tr>
                        <td>版本编号</td>
                        <td>Apk文件名称</td>
                        <td>Apk位置</td>
                        <td>下载链接</td>
                        <td>版本大小</td>
                        <td>版本信息</td>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach items="${app.appVersions}" var="obj">
                        <tr>
                            <td>${obj.versionNo}</td>
                            <td>${obj.apkFilename}</td>
                            <td>${obj.apklocPath}</td>
                            <td><a href="${obj.downloadLink}">${obj.downloadLink}</a></td>
                            <td>${obj.versionSize}</td>
                            <td>${obj.versionInfo}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>


        </fieldset>



    </div>

    <jsp:include page="/jsp/common/footer.jsp" />
</div>

<script>
    layui.use(['jquery', 'layer','element','form'], function(){
        var $ = layui.jquery  //重点处
            ,layer = layui.layer
            ,form = layui.form
            ,element = layui.element

    });


</script>
</body>
</html>