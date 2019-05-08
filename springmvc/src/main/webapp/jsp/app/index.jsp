<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <legend>查询条件</legend>
            <form class="layui-form" action="${ctx}/index/devId/queryAll" method="post">
                <input type="hidden" name="pageNumber" lay-verify="required|pageNumber" autocomplete="off" class="layui-input" value="${pageInfo.pageNum}" >
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">软件名称</label>
                        <div class="layui-input-inline">
                            <input type="tel" name="appUsername" lay-verify="required|appUsername" autocomplete="off" class="layui-input" value="${untilObj.appUsername}">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">APP状态</label>
                        <div class="layui-input-inline">
                            <select  lay-filter="aihao" name="appStatus">
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
                            <select lay-filter="appType" name="appType">
                                <option value="">请选择</option>
                                <c:forEach items="${dictionariesType}" var="obj">
                                    <option value="${obj.valueId}" <c:if test="${obj.valueId eq untilObj.appType}">selected</c:if>>${obj.valueName}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">一级分类</label>
                        <div class="layui-input-inline">
                            <select  lay-filter="categoriesOne" name="categoriesOne" id="categoriesOne">
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
                            <select  lay-filter="categoriesTwo" name="categoriesTwo" id="categoriesTwo">
                                <option value=""></option>
                            </select>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">三级分类</label>
                        <div class="layui-input-inline">
                            <select  lay-filter="categoriesThree" name="categoriesThree" id="categoriesThree">
                                <option value=""></option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-inline">
                        <input class="layui-btn layui-btn-normal" value="查询" type="submit">
                    </div>
                </div>
            </form>
        </fieldset>
        <button class="layui-btn layui-btn-normal" onclick="window.location.href='${ctx}/appInfo/ToAdd'">添加App信息</button>
        <table class="layui-table">
            <thead>
                <tr>
                    <th>软件名称</th>
                    <th>APK名称</th>
                    <th>软件大小(单位M)</th>
                    <th>所属平台</th>
                    <th>所属分类(一级分类、二级分类、三级分类)</th>
                    <th>状态</th>
                    <th>下载次数</th>
                    <th>最新版本号</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach  items="${pageInfo.list}" var="obj">
                    <tr>
                        <td>${obj.softwareName}</td>
                        <td>${obj.apkName}</td>
                        <td>${obj.softwareSize}</td>
                        <td>${obj.appUntilObj.appTypeName}</td>
                        <td>${obj.appCategorylevel1.categoryName}->${obj.appCategorylevel2.categoryName}->${obj.appCategorylevel3.categoryName}</td>
                        <td>${obj.appUntilObj.appStatusName}</td>
                        <td>${obj.downLoads}</td>
                        <td>${obj.newAppVersion.versionNo}</td>
                        <td>
                            <a class="layui-btn layui-btn-normal" href="${ctx}/appInfo/update/${obj.id}"><i class="layui-icon  ">&#xe642;</i></a>
                            <a class="layui-btn layui-btn-danger" href="${ctx}/appInfo/del/${obj.id}"><i class="layui-icon  ">&#xe640;</i></a>
                            <a class="layui-btn" href="${ctx}/appInfo/queryDetail/${obj.id}"><i class="layui-icon" >&#xe615;</i></a>
                        </td>
                    </tr>
                </c:forEach>
                <tr>
                    <td>
                        共${pageInfo.total}条记录 ${pageInfo.pageNum}/${pageInfo.pages}
                    </td>
                    <td colspan="8">
                        <a href="javaScript:void(0);" page="first">首页</a>
                        <a href="javaScript:void(0);" page="privious">上一页</a>
                        <a href="javaScript:void(0);" page="next">下一页</a>
                        <a href="javaScript:void(0);" page="last">尾页</a>
                    </td>
                </tr>
            </tbody>
        </table>


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
            var id = $('select[name="categoriesOne"] ').val();
            if(id==0){
                var html = '<option value="">请选择</option>';
                $('select[name="categoriesTwo"]').html(html);
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
                        $('select[name="categoriesTwo"]').html(html);
                        form.render();
                    },
                    error:function () {

                    }
                })
            }
        });
        form.on('select(categoriesTwo)',function () {
            //获取CategoriesOne的id

            var id = $('select[name="categoriesTwo"] ').val();

            if(id==0){
                var html = '<option value="">请选择</option>';
                $('select[name="categoriesThree"]').html(html);
                form.render()
            }else{
            $.ajax({
                url:"${ctx}/queryLevelThreeByLevelTwo/"+id,
                dateType:"application/json",
                type:"post",
                success:function (date) {
                    var html = '<option value="">请选择</option>';

                    for(var i = 0;i<date.length;i++){
                        html+='<option value="'+date[i].id+'">'+date[i].categoryName+'</option>';
                    };
                    $('select[name="categoriesThree"]').html(html);
                    form.render();
                },
                error:function () {
                }
            })
            }
        });
        //分页事件==================================
        $('a[page]').click(function () {

            var pageNum = 1;
            var currpageNum = '${pageInfo.pageNum}';
            var v = $(this).attr('page');
            var pageSize = "${pageInfo.pages}";
            switch (v){
                case 'first':
                    pageNum =1;
                    break;
                case 'privious':
                    pageNum = parseInt(currpageNum)-1;
                    if(pageNum <1){
                        return ;
                    }
                    break;
                case 'next':
                    pageNum = parseInt(currpageNum)+1;
                    if(pageNum>pageSize){
                        return ;
                    }
                    break;
                case 'last':
                    pageNum = pageSize;
                    break;
            }
            $('input[name=pageNumber]').val(pageNum);
            $('form').submit();
        });


        $(function () {
            var msg = '${updateMsg}';
            if(msg =='修改成功'){
                $.message.show({
                    title: '修改信息窗口',
                    msg: msg,
                    timeout: 1000,
                    showType: 'silde',
                });
            }else if(msg =='修改出现错误'){
                $.message.show({
                    title: '修改信息窗口',
                    msg: msg,
                    timeout: 1000,
                    showType: 'silde',
                });

            }
            var levelOne = $('#categoriesOne').val();
            if(levelOne!=null&&levelOne!=''){
                var levelTwo = "${untilObj.categoriesTwo}";
                if(levelTwo !=null&&levelTwo!=undefined&&levelTwo!=''){
                    $.ajax({
                        url:"${ctx}/queryLevelTwoByLevelTwo/"+levelOne,
                        dateType:"application/json",
                        type:"post",
                        success:function (date) {
                            var html = '<option value="">请选择</option>';

                            for(var i = 0;i<date.length;i++){
                                html+='<option value="'+date[i].id+'"';
                                if(date[i].id == levelTwo){
                                    html+=" selected ";
                                }
                                html+='>'+date[i].categoryName+'</option>';
                            }
                            $('select[name="categoriesTwo"]').html(html);
                            form.render();
                        },
                        error:function () {
                        }
                    })


                    var levelThree ="${untilObj.categoriesThree}";
                    if(levelThree !=null&&levelThree!=undefined&&levelThree!=''){
                        $.ajax({
                            url:"${ctx}/queryLevelThreeByLevelTwo/"+levelTwo,
                            dateType:"application/json",
                            type:"post",
                            success:function (date) {
                                var html = '<option value="">请选择</option>';

                                for(var i = 0;i<date.length;i++){
                                    html+='<option value="'+date[i].id+'"';
                                    if(date[i].id == levelThree){
                                        html+=" selected ";
                                    }
                                    html+='>'+date[i].categoryName+'</option>';
                                }
                                $('select[name="categoriesThree"]').html(html);
                                form.render();
                            },
                            error:function () {
                            }
                        })
                    }
                }



            }



        })

    });


</script>
</body>
</html>