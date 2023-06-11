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
                <form class="search" action="/account/${user.id}/page/1" method="get">
                    <input type="text" class="search_text" name="waccount" placeholder="请精确输入账号" value="${account.waccount}">
                    <input type="submit" value="搜索" class="search_bottom">
                </form>
                <button class="add"><a href="/addAccount/${user.id}/${account.wname}" style="color: white">添加</a></button>
                <div class="table_bg">
                    <table>
                        <tr>
                            <%--<th class="web_name">网站名</th>--%>
                            <th class="web_account">账号</th>
                            <th class="web_password">密码</th>
                            <th colspan="2" class="operate">操作</th>
                        </tr>
                        <c:if test="${accountPageInfo.list ne null and accountPageInfo.list ne ''}">
                            <c:forEach items="${accountPageInfo.list}" var="Account">
                                <tr>
                                    <%--<td class="web_name"><a href="${Account.web}">${Account.wname}</a></td>--%>
                                    <td class="web_account">${Account.waccount}</td>
                                    <td class="web_password">${Account.wpassword}</td>
                                    <td><a href="/modifyAccount/${Account.aid}" class="modify">修改</a></td>
                                    <td><a href="/deleteAccount/${Account.uid}/${Account.aid}"  class="delete">删除</a></td>
                                </tr>
                            </c:forEach>
                            <div class="page">
                                <c:if test="${accountPageInfo.hasPreviousPage}">
                                    <a href="/account/${user.id}/page/1?waccount=${account.waccount}" style="color: blue">首页</a>
                                </c:if>
                                <c:if test="${accountPageInfo.hasPreviousPage}">
                                    <a href="/account/${user.id}/page/${accountPageInfo.prePage}?waccount=${account.waccount}" style="color: blue">上一页</a>
                                </c:if>
                                <span>
                                    <c:forEach items="${accountPageInfo.navigatepageNums}" var="num">
                                        <c:if test="${accountPageInfo.pageNum == num}">
                                            <a href="/account/${user.id}/page/${num}?waccount=${account.waccount}" style="color: red">【${num}】</a>
                                        </c:if>
                                        <c:if test="${accountPageInfo.pageNum != num}">
                                            <a href="/account/${user.id}/page/${num}?waccount=${account.waccount}" style="color: blue">${num}</a>
                                        </c:if>
                                    </c:forEach>
                                </span>
                                <c:if test="${accountPageInfo.hasNextPage}">
                                    <a href="/account/${user.id}/page/${accountPageInfo.nextPage}?waccount=${account.waccount}" style="color: blue">下一页</a>
                                </c:if>
                                <c:if test="${accountPageInfo.hasNextPage}">
                                    <a href="/account/${user.id}/page/${accountPageInfo.pages}?waccount=${account.waccount}" style="color: blue">末页</a>
                                </c:if>
                            </div>
                        </c:if>
                        <c:if test="${accountPageInfo.list eq null or accountPageInfo.list eq ''}">
                            <tr>
                                <td colspan="4" style="text-align: center;margin: auto">没有该网站</td>
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
