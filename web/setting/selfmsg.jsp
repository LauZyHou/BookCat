<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "http://www.w3.org/TR/xhtml1/DTD/xhtml1-trasitional.dtd">
<html>
<head>
    <!--文档字符编码为utf-8-->
    <meta charset="utf-8">
    <!--自定义渲染方式:当使用IE为内核的浏览器,会渲染至它支持的最高版本;当启用Chrome Frame,会被Chrome内核渲染-->
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <!--设定网页的布局:宽度为设备宽度,页面的初始缩放值为1-->
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <!--Buttons CSS按钮样式库-->
    <link href="../WEB-RELY/button.css" rel="stylesheet" type="text/css">
    <!--BootStrap依赖-->
    <link rel="stylesheet" href="../WEB-RELY/bootstrap.min.css">
    <script src="../WEB-RELY/jquery.min.js"></script>
    <script src="../WEB-RELY/popper.min.js"></script>
    <script src="../WEB-RELY/bootstrap.min.js"></script>
    <!--iCheck CSS复选框单选按钮库-->
    <link href="../WEB-RELY/polaris.css" rel="stylesheet">
    <script src="../WEB-RELY/icheck.min.js"></script>
    <!--字体的CDN-->
    <link href='http://cdn.webfont.youziku.com/webfonts/nomal/117834/19650/5af08244f629d8100cf43a22.css'
          rel='stylesheet' type='text/css'>
    <link href='http://cdn.webfont.youziku.com/webfonts/nomal/117834/46121/5af9bad5f629d910dce29d2c.css'
          rel='stylesheet' type='text/css'>
    <link href='http://cdn.webfont.youziku.com/webfonts/nomal/117834/45817/5af08133f629d8100cf43a20.css'
          rel='stylesheet' type='text/css'>
    <!--FontAwesome图标库-->
    <link rel="stylesheet" href="../WEB-RELY/font-awesome-4.7.0/css/font-awesome.min.css">
    <!--自定-->
    <link rel="stylesheet" href="../setting/selfmsg.css">
    <!--标题-->
    <title>个人资料</title>
</head>
<!---------------------------------------------------------------------------------------->
<body>
<!--导航栏部分-->
<nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
    <!--导航栏Logo-->
    <a class="navbar-brand" href="#">BookCat</a>
    <!--导航栏表单-->
    <form class="form-inline">
        <div class="input-group">
            <!--在输入框前添加小标签-->
            <span class="input-group-addon"><i class="fa fa-search" aria-hidden="true"></i></span>
            <!--输入框-->
            <input type="text" class="form-control" placeholder="搜索你想要的书籍">
        </div>
    </form>
    <!--导航栏中的导航组-->
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link" href="#">热门</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#">分类</a>
        </li>
        <!--下拉组-->
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                设置
            </a>
            <div class="dropdown-menu">
                <a class="dropdown-item" href="#">个人资料</a>
                <a class="dropdown-item" href="#">收货地址</a>
                <a class="dropdown-item" href="#">购买记录</a>
            </div>
        </li>
    </ul>
</nav>
<br><br><br>
<!--信息放在响应式容器中,定义伪类以清除浮动-->
<div class="container clearfloat">
    <!--卡片-->
    <div class="card">
        <img class="card-img-top" src="http://static.runoob.com/images/mix/img_avatar.png" alt="Card image">
        <div class="card-body">
            <h4 class="card-title">刘知昊</h4>
            <p class="card-text">作为一只小猫咪就只会喵喵喵喵喵，喵喵喵喵喵，喵喵喵。</p>
            <a href="#" class="btn btn-primary">修改头像</a>
        </div>
    </div>
    <!--bs4的超大屏幕-->
    <div class="jumbotron">
        <!--进度条:个人信息完善程度-->
        <h4>个人信息完善度：</h4>
        <div class="progress">
            <div class="progress-bar progress-bar-striped progress-bar-animated" style="width:40%"></div>
        </div>
        <br>
        <%--表单--%>
        <s:form action="#" id="form">
            <div class="syn clearfloat">
                <h4>用户昵称：</h4>
                <s:textfield name="" class="form-control" placeholder="用户昵称"/>
            </div>
            <div class="syn clearfloat">
                <h4>密码：</h4>
                <s:password name="" class="form-control" placeholder="密码"/>
            </div>
            <div class="syn clearfloat" id="areasyn">
                <h4>读书宣言：</h4>
                <s:textarea name="" class="form-control" placeholder="读书宣言" id="area"/>
            </div>
            <%--提交--%>
            <span class="button-wrap">
                <s:submit class="button button-pill button-raised button-primary" value="保存"/>
            </span>
            <%--重置--%>
            <span class="button-wrap">
                <s:reset class="button button-pill" value="重置"/>
            </span>
        </s:form>
    </div>
</div>
</body>
</html>