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
    <link rel="stylesheet" href="../../css/register.css">
</head>
<body>
    <div id="form_bg">
        <form class="layui-form" action="/registerCheck">
            <div class="welcome">注册</div>
            <div class="layui-form-item">
                <label class="layui-form-label" id="label3">昵称</label>
                <div class="layui-input-block">
                    <input type="text" name="uname" id="input3" required  lay-verify="required" placeholder="请输入昵称" autocomplete="off" class="layui-input">
                    <div class="tip">*8个字以内</div>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label" id="label1">账号</label>
                <div class="layui-input-block">
                    <input type="text" name="account" id="input1" required  lay-verify="required|phone" placeholder="请输入手机号" autocomplete="off" class="layui-input">
                    <div class="tip">*账号仅限手机号</div>
                </div>
            </div>
            <div class="layui-form-item" id="text2">
                <label class="layui-form-label" id="label2">密码</label>
                <div class="layui-input-block">
                    <input type="password" name="password" id="input2" required placeholder="请输入密码" autocomplete="off" class="layui-input">
                    <div class="tip">*密码8-16位，至少有一个大写或小写字母、一个数字、一个特殊字符，示例如下：<br>
                        <div style="color: black">
                            -&emsp;`&emsp;=&emsp;;&emsp;'&emsp;,&emsp;.&emsp;~&emsp;!&emsp;@&emsp;#&emsp;$&emsp;%&emsp;^&emsp;&&emsp;*&emsp;(&emsp;)&emsp;_&emsp;+&emsp;|&emsp;{&emsp;}&emsp;:&emsp;"&emsp;?
                        </div>
                    </div>
                </div>
            </div>
            <div class="layui-form-item" id="button1">
                <button class="layui-btn layui-bg-blue" lay-submit lay-filter="formDemo" style="transform: translate(0,40%)">注册</button>
            </div>
        </form>
        <div class="register"><a href="/login" style="color: blue">登录</a></div>
    </div>
    <script>
        var passwordInput = document.getElementById('input2');
        passwordInput.onblur = checkpassword;
        function checkpassword() {
            var password = passwordInput.value.trim();
            var reg = /^(?![0-9A-Za-z]+$)(?![-`=\[\];',.~!@#$%^&*()_+|{}:"?]+$)(?![0-9-`=\[\];',.~!@#$%^&*()_+|{}:"?]+$)(?![A-Za-z-`=\[\];',.~!@#$%^&*()_+|{}:"?]+$)[0-9a-zA-Z-`=\[\];',.~!@#$%^&*()_+|{}:"?]{8,16}$/;
            var flag = reg.test(password);
            if(!flag) {alert('密码格式错误');}
            return flag;
        }
    </script>
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
    <c:if test="${message eq '该账号已注册'}">
        <script>
            alert("该账号已注册!!!");
        </script>
    </c:if>
    <c:if test="${message eq '注册失败'}">
        <script>
            alert("注册失败!!!");
        </script>
    </c:if>
    <script src="../../lib/layui/layui.js"></script>
</body>
</html>
