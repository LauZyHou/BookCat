<%@ page import="org.model.User" %>
<%@ page import="com.opensymphony.xwork2.ActionContext" %>
<%@ page import="java.util.Map" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
    <!--外部共用-->
    <s:include value="../sharing/extern.jsp"/>
    <script src="../sharing/icheckblue.js"></script>
    <!--导航栏样式和动作-->
    <link rel="stylesheet" href="../sharing/navbar.css">
    <script src="../sharing/navbar.js"></script>
    <!--自定-->
    <link rel="stylesheet" href="../setting/selfmsg.css">
    <script type="text/javascript" src="../setting/selfmsg.js"></script>
    <!--标题-->
    <title>个人资料</title>
</head>
<!---------------------------------------------------------------------------------------->
<body>
<!--导航栏-->
<s:include value="../sharing/navbar.jsp"/>
<br><br><br>

<!--信息放在响应式容器中,定义伪类以清除浮动-->
<div class="container clearfloat">
    <!--卡片-->
    <div class="card">
        <img id="head_img" class="card-img-top" src="/pic/User/<s:property value="#session.usr.id"/>.jpg" alt="Card image">
        <div class="card-body">
            <h4 class="card-title">${sessionScope.usr.name}</h4>
            <p class="card-text">作为一只小猫咪就只会喵喵喵喵喵，喵喵喵喵喵，喵喵喵。</p>
            <a href="#" class="button button-3d button-primary button-rounded" onclick="showChangeHead()">修改头像</a>
        </div>
    </div>
    <!--bs4的超大屏幕-->
    <div class="jumbotron">
        <!--进度条:个人信息完善程度-->
        <h4>个人信息完善度</h4>
        <!--嵌入java代码来判断完成度-->
        <%! int precentage=40;%>
        <%
            Map map=ActionContext.getContext().getSession();
            User user=(User)map.get("usr");
            String name=user.getName();
            String motto=user.getMotto();
            boolean sex=user.isSex();
            if(name==null||name.equals("")||motto==null||motto.equals(""))
                precentage=40;
            else
                precentage=100;
        %>

        <div class="progress">
            <div class="progress-bar progress-bar-striped progress-bar-animated bg-success" style="width:<%=precentage%>%"></div>
        </div>
        <br>
        <%--表单--%>
        <s:form action="update" id="form">
            <div class="syn clearfloat">
                <h4>用户昵称：</h4>
                <s:textfield name="name" value="%{#session.usr.name}" class="form-control" placeholder="用户昵称"/>
            </div>
            <div class="syn clearfloat">
                <h4>性别：</h4>
                <div id="sex">
                    <div id="mangrp">
                        <label for="man">男</label>
                        <input type="radio" name="sex" value="true"id="man" ${usr.sex==true?'checked':''}>
                    </div>
                    <div id="womangrp">
                        <label for="woman">女</label>
                        <input type="radio" name="sex" value="false" id="woman" ${usr.sex==false?'checked':''}>
                    </div>
                </div>
            </div>
            <div class="syn clearfloat" id="areasyn">
                <h4>读书宣言：</h4>
                <s:textarea name="motto" value="%{#session.usr.motto}" class="form-control" placeholder="读书宣言" id="area"/>
            </div>
            <%--提交--%>
            <span class="button-wrap">
                <s:submit class="button button-pill button-raised button-royal" value="保存"/>
            </span>
            <%--重置--%>
            <span class="button-wrap">
                <s:reset class="button button-pill" value="重置"/>
            </span>
        </s:form>
    </div>
</div>
<%--修改头像的modal--%>
<s:include value="../setting/selfmsgmodal.jsp"/>
</body>
</html>