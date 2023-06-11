<%--
  Created by IntelliJ IDEA.
  User: 13534
  Date: 2022/11/3
  Time: 20:55
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
                <span>欢迎，${user.uname}&emsp;</span>
                <span><a href="/toLogin" style="color: red;">注销</a></span>
            </div>
        </div>
        <div class="middle">
            <div class="left">
                <ul style="transform: translate(0,10%)">
                    <li class="line"><a href="/web/${user.id}/page/1">账号</a></li><hr>
                    <li class="line"><a href="">个人中心</a></li><hr>
                </ul>
            </div>
            <div class="right">
                <div class="add_top">修改密码</div>
                <form class="layui-form" action="/passwordModify/${user.id}" method="post">
                    <div class="layui-form-item">
                        <label class="layui-form-label">旧密码</label>
                        <div class="layui-input-block">
                            <input type="password" name="oldpassword" id="input_1" required lay-verify="required" placeholder="请输入旧密码" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">新密码</label>
                        <div class="layui-input-block">
                            <input type="password" name="newpassword" id="input_2" required lay-verify="required" placeholder="请输入新密码" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">确认密码</label>
                        <div class="layui-input-block">
                            <input type="password" name="newpassword2" id="input_3" required lay-verify="required" placeholder="请再次输入新密码" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <button class="layui-btn layui-bg-blue" lay-submit lay-filter="formDemo">提交</button>
                    </div>
                </form>
            </div>
        </div>
        <p class="bottom">背景图来源：<a href="https://www.pixiv.net" style="color: #0000FF">Y_Y</a></p>
    </div>
    <script>
        var passwordInput = document.getElementById('input_2');
        var passwordInput2 = document.getElementById('input_3');
        passwordInput.onblur = checkpassword;
        passwordInput2.onblur = checkagainpassword;
        function checkpassword() {
            var password = passwordInput.value.trim();
            var reg = /^(?![0-9A-Za-z]+$)(?![-`=\[\];',.~!@#$%^&*()_+|{}:"?]+$)(?![0-9-`=\[\];',.~!@#$%^&*()_+|{}:"?]+$)(?![A-Za-z-`=\[\];',.~!@#$%^&*()_+|{}:"?]+$)[0-9a-zA-Z-`=\[\];',.~!@#$%^&*()_+|{}:"?]{8,16}$/;
            var flag = reg.test(password);
            if(!flag) {alert('密码格式错误');}
            return flag;
        }
        function checkagainpassword() {
            var password = passwordInput.value.trim();
            var password2 = passwordInput2.value.trim();
            var reg = /^(?![0-9A-Za-z]+$)(?![-`=\[\];',.~!@#$%^&*()_+|{}:"?]+$)(?![0-9-`=\[\];',.~!@#$%^&*()_+|{}:"?]+$)(?![A-Za-z-`=\[\];',.~!@#$%^&*()_+|{}:"?]+$)[0-9a-zA-Z-`=\[\];',.~!@#$%^&*()_+|{}:"?]{8,16}$/;
            var flag1 = reg.test(password2);
            var flag2 = password.text(password2)
            if(!flag1) {alert('密码格式错误');}
            else if(!flag2) {alert('两次密码不一致')}
            else return flag1 & flag2;
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
    <c:if test="${message eq '旧密码错误'}">
        <script>
            alert("旧密码错误!!!");
        </script>
    </c:if>
    <c:if test="${message eq '新密码与确认密码不相等'}">
        <script>
            alert("新密码与确认密码不相等!!!");
        </script>
    </c:if>
    <script src="../../lib/layui/layui.js"></script>
</body>
</html>
