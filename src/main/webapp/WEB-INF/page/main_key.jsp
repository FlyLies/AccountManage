<%--
  Created by IntelliJ IDEA.
  User: 13534
  Date: 2023/2/7
  Time: 22:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>账号管理系统</title>
    <link rel="stylesheet" href="../../lib/layui/css/layui.css">
    <link rel="stylesheet" href="../../css/main.css">
    <%--<link rel="stylesheet" href="/css/main.css">
    <link rel="stylesheet" href="/lib/layui/css/layui.css">--%>
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
                    <li class="line"><a href="/key/${user.id}">账号</a></li><hr>
                    <li class="line"><a href="/key/${user.id}">个人中心</a></li><hr>
                </ul>
            </div>
            <div class="right">
                <div class="key_welcome">欢迎使用账号管理系统</div>
                <div class="key_tips">提示：需要输入密钥才能管理自己的账号哦</div>
                <form class="key_input" action="/keyCheck/${user.id}" method="post">
                    <input type="password" class="search_text" name="des_key" placeholder="请输入密钥">
                    <input type="submit" value="提交" class="search_bottom">
                </form>
            </div>
        </div>
        <p class="bottom">背景图来源：<a href="https://www.pixiv.net" style="color: #0000FF">Y_Y</a></p>
    </div>
    <script src="../../lib/layui/layui.js"></script>
    <c:if test="${message eq '删除成功'}">
        <script>
            alert("删除成功!!!");
        </script>
    </c:if>
    <c:if test="${message eq '密钥错误'}">
        <script>
            alert("密钥错误!!!");
        </script>
    </c:if>
</body>
</html>
