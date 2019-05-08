
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>添加信息</title>
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
        <form class="layui-form" action="${ctx}/appInfo/ToAdd" method="post">
            <input type="hidden" name="pageNumber" lay-verify="required|pageNumber" autocomplete="off" class="layui-input"  >
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">软件名称</label>
                    <div class="layui-input-inline">
                        <input type="tel" name="softwareName" lay-verify="required|appUsername" autocomplete="off" class="layui-input" >
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">apk名称</label>
                    <div class="layui-input-inline">
                        <input type="tel" name="apkName" lay-verify="required|appUsername" autocomplete="off" class="layui-input" >
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">支持ROM</label>
                    <div class="layui-input-inline">
                        <input type="tel" name="supportTrom" lay-verify="required|appUsername" autocomplete="off" class="layui-input" >
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">界面语言</label>
                    <div class="layui-input-inline">
                        <input type="tel" name="interfaceLanguage" lay-verify="required|appUsername" autocomplete="off" class="layui-input" >
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">软件大小</label>
                    <div class="layui-input-inline">
                        <input type="tel" name="softwareSize" lay-verify="required|appUsername" autocomplete="off" class="layui-input" >
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">APP状态</label>
                    <div class="layui-input-inline">
                        <select  lay-filter="status" name="appUntilObj.appStatus">
                            <option value="">请选择</option>

                            <c:forEach items="${dictionariesStatus}" var="obj">
                                <option value="${obj.valueId}" <c:if test="${obj.valueId eq untilObj.appStatus}">selected</c:if>>${obj.valueName}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">所属平台</label>
                    <div class="layui-input-inline">
                        <select lay-filter="flatfromId" name="appUntilObj.appType">
                            <option value="">请选择</option>
                            <c:forEach items="${dictionariesType}" var="obj">
                                <option value="${obj.valueId}" <c:if test="${obj.valueId eq untilObj.appType}">selected</c:if>>${obj.valueName}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">一级分类</label>
                    <div class="layui-input-inline">
                        <select  lay-filter="categoriesOne" name="appCategorylevel1.id" id="categoriesOne">
                            <option value="">请选择</option>
                            <c:forEach items="${appCategoriesOne}" var="obj">
                                <option value="${obj.id}" <c:if test="${obj.id eq untilObj.categoriesOne}">selected</c:if>>${obj.categoryName}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">二级分类</label>
                    <div class="layui-input-inline">
                        <select  lay-filter="categoriesTwo" name="appCategorylevel2.id" id="categoriesTwo">
                            <option value=""></option>
                        </select>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">三级分类</label>
                    <div class="layui-input-inline">
                        <select  lay-filter="categoriesThree" name="appCategorylevel3.id" id="">
                            <option value=""></option>
                        </select>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">版本信息</label>
                    <div class="layui-input-inline">
                        <input type="text" name="versionId" lay-verify="required|versionId" autocomplete="off" class="layui-input"  placeholder="如：V.1.1.1">
                    </div>
                </div>
            </div>
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">app基本信息</label>
                <div class="layui-input-block">
                    <textarea placeholder="请输入内容" class="layui-textarea" name="appInfo"></textarea>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-inline">
                    <input class="layui-btn layui-btn-normal" value="添加" type="submit">
                </div>
            </div>


        </form>
    </div>

    <jsp:include page="/jsp/common/footer.jsp" />
</div>

<script>
    layui.use(['jquery', 'layer','element','form'], function(){
        var $ = layui.jquery  //重点处
            ,layer = layui.layer
            ,form = layui.form
            ,element = layui.element

        form.on('select(categoriesOne)',function () {
            //获取CategoriesOne的id
            var id = $('#categoriesOne ').val();
            if(id==0){
                var html = '<option value="">请选择</option>';
                $('#categoriesTwo').html(html);
                form.render()
            }else{
                $.ajax({
                    url:"${ctx}/queryLevelTwoByLevelOne/"+id,
                    dateType:"application/json",
                    type:"post",
                    success:function (date) {
                        var html = '<option value="">请选择</option>';

                        for(var i = 0;i<date.length;i++){
                            html+='<option value="'+date[i].id+'">'+date[i].categoryName+'</option>';
                        }
                        $('#categoriesTwo').html(html);
                        form.render();
                    },
                    error:function () {

                    }
                })
            }
        });
        form.on('select(categoriesTwo)',function () {
            //获取CategoriesOne的id

            var id = $('#categoriesTwo ').val();

            if(id==0){
                var html = '<option value="">请选择</option>';
                $('#categoriesTwo ').html(html);
                form.render()
            }else{
                $.ajax({
                    url:"${ctx}/queryLevelTwoByLevelTwo/"+id,
                    dateType:"application/json",
                    type:"post",
                    success:function (date) {
                        var html = '<option value="">请选择</option>';

                        for(var i = 0;i<date.length;i++){
                            html+='<option value="'+date[i].id+'">'+date[i].categoryName+'</option>';
                        };
                        $('#categoriesThree').html(html);
                        form.render();
                    },
                    error:function () {
                    }
                })
            }
        });
    });
</script>
</body>
</html>
