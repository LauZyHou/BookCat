<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!--外部共用-->
    <s:include value="../sharing/extern.jsp"/>
    <!--导航栏样式和动作-->
    <link rel="stylesheet" href="../sharing/navbar.css">
    <script src="../sharing/navbar.js"></script>
    <!--自定-->
    <link rel="stylesheet" href="../main/main.css">
    <!--标题-->
    <title>BookCat首页</title>
</head>
<!---------------------------------------------------------------------------------------->
<body>
<!--导航栏-->
<s:include value="../sharing/navbar.jsp"/>
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

<%
    //使用java访问session以确定是否登陆了
%>
<!--超大屏幕和书籍排名-->
<div class="container clearfloat" id="jum_but">
    <!--超大屏幕:提示登入/用户欢迎信息-->
    <div class="jumbotron">
        <h1>现在加入BookCat！</h1>
        <h5>加入BookCat，和更多读书爱好者交流，获取最新的书籍动态，享受可靠实惠的购书渠道。</h5>
        <br>
        <a class="button button-glow button-border button-rounded button-royal" role="button"
            href="../join/login.jsp">立即登入</a>
    </div>
    <!--书籍排名-->
    <div class="ranking">
        这里是书籍排名
    </div>
</div>
<!--主页上的一些书-->
<div class="container" id="#bookbox">
    <div class="rowbox clearfloat">
<%
    for(int i=1;i<=14;i++){
%>
        <a class="imgbox" href="bkmsg?id=<%=i%>" target="_blank"><img src="../WEB-PIC/Exhibition/<%=i%>.jpg"></a>
<%
        if(i%5==0){
%>
            </div><div class="rowbox clearfloat">
<%
        }
    }
%>
    </div>
</div>
<!--页脚-->
<footer>
    BookCat-让文字点亮你的生活！<br>
    关于我们 · 联系我们 · 加入我们 · 服务声明 · 友情链接 · 网站地图 · 移动应用
</footer>
</body>
</html>