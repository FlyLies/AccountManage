<%--
  Created by IntelliJ IDEA.
  User: 13534
  Date: 2022/10/21
  Time: 16:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>账号管理系统</title>
    <link rel="stylesheet" href="../../lib/layui/css/layui.css">
    <link rel="stylesheet" href="../../css/login.css">
</head>
<body>
    <div id="form_bg">
        <form class="layui-form" action="/loginCheck" method="post">
            <div class="welcome">欢迎使用账号管理系统</div>
            <div class="layui-form-item">
                <label class="layui-form-label" id="label1">账号</label>
                <div class="layui-input-block">
                    <input type="text" name="uaccount" id="input1" required  lay-verify="required|phone" placeholder="请输入手机号" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" id="text2">
                <label class="layui-form-label" id="label2">密码</label>
                <div class="layui-input-block">
                    <input type="password" name="upassword" id="input2" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" id="button1">
                <button class="layui-btn layui-bg-blue" lay-submit lay-filter="formDemo">登录</button>
            </div>
        </form>
        <div class="register"><a href="/register" style="color: blue">注册</a></div>
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
    <c:if test="${message eq '账号不存在'}">
        <script>
            alert("账号不存在!!!");
        </script>
    </c:if>
    <c:if test="${message eq '密码错误'}">
        <script>
            alert("密码错误!!!");
        </script>
    </c:if>
    <c:if test="${message eq '修改成功'}">
        <script>
            alert("修改成功!!!");
        </script>
    </c:if>
    <c:if test="${message eq '注册成功'}">
        <script>
            alert("注册成功!!!");
            alert("密钥为："+${key});
        </script>
    </c:if>
    <script src="../../lib/layui/layui.js"></script>
</body>
</html>
