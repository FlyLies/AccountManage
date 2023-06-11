<%--
  Created by IntelliJ IDEA.
  User: 13534
  Date: 2023/2/7
  Time: 22:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>账号管理系统</title>
    <%--    <link rel="stylesheet" href="../../lib/layui/css/layui.css">--%>
    <%--    <link rel="stylesheet" href="../../css/main.css">--%>
    <link rel="stylesheet" href="/css/main.css">
    <link rel="stylesheet" href="/lib/layui/css/layui.css">
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
                <li class="line"><a href="/modifyPassword/${user.id}">个人中心</a></li><hr>
            </ul>
        </div>
        <div class="right">
            <form class="search" action="/web/${user.id}/page/1" method="get">
                <input type="text" class="search_text" name="wname" placeholder="请输入网站名" value="${account.wname}">
                <input type="submit" value="搜索" class="search_bottom">
            </form>
            <button class="add"><a href="/addWeb/${user.id}" style="color: white">添加</a></button>
            <div class="table_bg">
                <table>
                    <tr>
                        <th class="web_name">网站名</th>
                        <th colspan="3" class="web_operate_user">操作</th>
                    </tr>
                    <c:if test="${accountPageInfo.list ne null and accountPageInfo.list ne ''}">
                        <c:forEach items="${accountPageInfo.list}" var="Account">
                            <tr>
                                <c:if test="${Account.web ne null and Account.web ne ''}">
                                    <td class="web_name">
                                        <a href="${Account.web}">${Account.wname}</a>
                                    </td>
                                </c:if>
                                <c:if test="${Account.web eq null or Account.web eq ''}">
                                    <td class="web_name">
                                        ${Account.wname}
                                    </td>
                                </c:if>
                                <td><a href="/account/${Account.uid}/${Account.wname}/page/1" class="account_manage">账号管理</a></td>
                                <td><a href="/modifyWeb/${Account.uid}/${Account.wname}"  class="modify">修改</a></td>
                                <td><a href="/deleteWeb/${Account.uid}/${Account.wname}"  class="delete">删除</a></td>
                            </tr>
                        </c:forEach>
                        <div class="page">
                            <c:if test="${accountPageInfo.hasPreviousPage}">
                                <a href="/web/${user.id}/page/1?wname=${account.wname}" style="color: blue">首页</a>
                            </c:if>
                            <c:if test="${accountPageInfo.hasPreviousPage}">
                                <a href="/web/${user.id}/page/${accountPageInfo.prePage}?wname=${account.wname}" style="color: blue">上一页</a>
                            </c:if>
                            <span>
                                    <c:forEach items="${accountPageInfo.navigatepageNums}" var="num">
                                        <c:if test="${accountPageInfo.pageNum == num}">
                                            <a href="/web/${user.id}/page/${num}?wname=${account.wname}" style="color: red">【${num}】</a>
                                        </c:if>
                                        <c:if test="${accountPageInfo.pageNum != num}">
                                            <a href="/web/${user.id}/page/${num}?wname=${account.wname}" style="color: blue">${num}</a>
                                        </c:if>
                                    </c:forEach>
                                </span>
                            <c:if test="${accountPageInfo.hasNextPage}">
                                <a href="/web/${user.id}/page/${accountPageInfo.nextPage}?wname=${account.wname}" style="color: blue">下一页</a>
                            </c:if>
                            <c:if test="${accountPageInfo.hasNextPage}">
                                <a href="/web/${user.id}/page/${accountPageInfo.pages}?wname=${account.wname}" style="color: blue">末页</a>
                            </c:if>
                        </div>
                    </c:if>
                    <c:if test="${accountPageInfo.list eq null or accountPageInfo.list eq ''}">
                        <tr>
                            <td colspan="3" style="text-align: center;margin: auto">没有该网站</td>
                        </tr>
                    </c:if>
                </table>
            </div>
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
<c:if test="${message eq '删除失败'}">
    <script>
        alert("删除失败!!!");
    </script>
</c:if>
</body>
</html>