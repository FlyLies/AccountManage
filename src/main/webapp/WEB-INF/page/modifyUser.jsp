<%--
  Created by IntelliJ IDEA.
  User: 13534
  Date: 2023/4/14
  Time: 20:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>账号管理系统</title>
    <link rel="stylesheet" href="../../lib/layui/css/layui.css">
    <link rel="stylesheet" href="../../css/main.css">
</head>
<body>
    <div class="first">
        <div class="top">
            <div class="user">
                <span>欢迎，管理员&emsp;</span>
                <span><a href="/toLogin" style="color: red;">注销</a></span>
            </div>
        </div>
        <div class="middle">
            <div class="left">
                <ul style="transform: translate(0,10%)">
                    <li class="line"><a href="/admin/user/page/1">用户信息</a></li><hr>
                    <%--<li class="line"><a href="">个人中心</a></li><hr>--%>
                </ul>
            </div>
            <div class="right">
                <div class="add_top">修改用户信息</div>
                <form class="layui-form" action="/userModify/${user.id}" method="post">
                    <div class="layui-form-item">
                        <label class="layui-form-label">用户名</label>
                        <div class="layui-input-block">
                            <input type="text" name="uname" id="input_1" required lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input" value="${user.uname}">
                        </div>
                    </div>
                    <%--<div class="layui-form-item">
                        <label class="layui-form-label">网址</label>
                        <div class="layui-input-block">
                            <input type="text" name="web" id="input_2" placeholder="请输入网址" autocomplete="off" class="layui-input" value="${account.web}">
                        </div>
                    </div>--%>
                    <div class="layui-form-item">
                        <label class="layui-form-label">账号</label>
                        <div class="layui-input-block">
                            <input type="text" name="uaccount" id="input_3" required lay-verify="required" placeholder="请输入账号" autocomplete="off" class="layui-input" value="${user.uaccount}">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">密码</label>
                        <div class="layui-input-block">
                            <input type="text" name="upassword" id="input_4" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input" value="${user.upassword}">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <button class="layui-btn layui-bg-blue" lay-submit lay-filter="formDemo">提交</button>
                        <%--<button class="layui-btn layui-bg-blue" onclick="backSuper()">返回</button>--%>
                    </div>
                </form>
            </div>
        </div>
        <p class="bottom">背景图来源：<a href="https://www.pixiv.net" style="color: #0000FF">Y_Y</a></p>
    </div>
    <script>
        layui.use('form', function(){
            var form = layui.form;
            //监听提交
            form.on('submit(formDemo)', function(data){
                layer.msg(JSON.stringify(data.field));
                return false;
            });
        });
    </script>
    <c:if test="${message eq '修改成功'}">
        <script>
            alert("修改成功!!!");
        </script>
    </c:if>
    <c:if test="${message eq '修改失败'}">
        <script>
            alert("修改失败!!!");
        </script>
    </c:if>
    <script type="text/javascript">
        function backSuper() {
            window.history.go(-2);
        }
    </script>
    <script src="../../lib/layui/layui.js"></script>
</body>
</html>
