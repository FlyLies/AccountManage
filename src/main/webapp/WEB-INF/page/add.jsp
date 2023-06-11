<%--
  Created by IntelliJ IDEA.
  User: 13534
  Date: 2022/10/30
  Time: 0:53
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
                <div class="add_top">添加网站和账号</div>
                <form class="layui-form" action="/webAdd/${user.id}" method="post">
                    <div class="layui-form-item">
                        <label class="layui-form-label">网站名</label>
                        <div class="layui-input-block">
                            <input type="text" name="wname" id="input_1" required lay-verify="required" placeholder="请输入网站名" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">网址</label>
                        <div class="layui-input-block">
                            <input type="text" name="web" id="input_2" placeholder="请输入网址" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">账号</label>
                        <div class="layui-input-block">
                            <input type="text" name="waccount" id="input_3" required lay-verify="required" placeholder="请输入账号" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">密码</label>
                        <div class="layui-input-block">
                            <input type="password" name="wpassword" id="input_4" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
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
        layui.use('form', function(){
            var form = layui.form;
            //监听提交
            form.on('submit(formDemo)', function(data){
                layer.msg(JSON.stringify(data.field));
                return false;
            });
        });
    </script>
    <c:if test="${message eq '添加成功'}">
        <script>
            alert("添加成功!!!");
        </script>
    </c:if>
    <c:if test="${message eq '添加失败'}">
        <script>
            alert("添加失败!!!");
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
