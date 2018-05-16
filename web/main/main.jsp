<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!--文档字符编码为utf-8-->
    <meta charset="utf-8">
    <!--自定义渲染方式:当使用IE为内核的浏览器,会渲染至它支持的最高版本;当启用Chrome Frame,会被Chrome内核渲染-->
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <!--设定网页的布局:宽度为设备宽度,页面的初始缩放值为1-->
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <!--网页的关键字,目前似乎对SEO没有什么用了-->
    <meta name="keywords" content="BookCat,购书,买书,书籍,阅读,文字,读书">
    <!--网页的描述-->
    <meta name="description" content="BookCat购书系统是在J2EE课程的带领下完成的">
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
    <link rel="stylesheet" href="../main/main.css">
    <!--标题-->
    <title>BookCat</title>
</head>
<!---------------------------------------------------------------------------------------->
<body>
<!--导航栏部分-->
<nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
    <!--导航栏Logo-->
    <a class="navbar-brand" href="../main/main.jsp">BookCat</a>
    <!--导航栏表单-->
    <form class="form-inline">
        <div class="input-group">
            <!--在输入框前添加小标签-->
            <span class="input-group-addon">搜索</span>
            <!--输入框-->
            <input type="text" class="form-control" placeholder="搜索你想要的书籍">
            <button class="btn btn-primary" type="button"><i class="fa fa-search" aria-hidden="true"></i></button>
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
                <a class="dropdown-item" href="../setting/selfmsg.jsp">个人资料</a>
                <a class="dropdown-item" href="#">收货地址</a>
                <a class="dropdown-item" href="#">购买记录</a>
            </div>
        </li>
    </ul>
</nav>

<!--轮播部分-->
<div id="demo" class="carousel slide" data-ride="carousel">
    <!-- 指示符 -->
    <ul class="carousel-indicators">
        <li data-target="#demo" data-slide-to="0" class="active"></li>
        <li data-target="#demo" data-slide-to="1"></li>
        <li data-target="#demo" data-slide-to="2"></li>
    </ul>
    <!-- 轮播图片 -->
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="../WEB-PIC/Carousel/1.jpg">
        </div>
        <div class="carousel-item">
            <img src="../WEB-PIC/Carousel/2.jpg">
        </div>
        <div class="carousel-item">
            <img src="../WEB-PIC/Carousel/3.jpg">
        </div>
    </div>
    <!-- 左右切换按钮 -->
    <a class="carousel-control-prev" href="#demo" data-slide="prev">
        <span class="carousel-control-prev-icon"></span>
    </a>
    <a class="carousel-control-next" href="#demo" data-slide="next">
        <span class="carousel-control-next-icon"></span>
    </a>
</div>

<!--测试-->
<div class="container-fluid" style="margin-top:80px">
    <h3>固定导航栏</h3>
    <p>导航栏可以固定在头部或者底部。</p>
    <h1>滚动页面查看效果。</h1>
</div>
<div class="container-fluid" style="margin-top:80px">
    <h3>固定导航栏</h3>
    <p>导航栏可以固定在头部或者底部。</p>
    <h1>滚动页面查看效果。</h1>
</div>
<div class="container-fluid" style="margin-top:80px">
    <h3>固定导航栏</h3>
    <p>导航栏可以固定在头部或者底部。</p>
    <h1>滚动页面查看效果。</h1>
</div>
<div class="container-fluid" style="margin-top:80px">
    <h3>固定导航栏</h3>
    <p>导航栏可以固定在头部或者底部。</p>
    <h1>滚动页面查看效果。</h1>
</div>
<div class="container-fluid" style="margin-top:80px">
    <h3>固定导航栏</h3>
    <p>导航栏可以固定在头部或者底部。</p>
    <h1>滚动页面查看效果。</h1>
</div>
</body>
</html>