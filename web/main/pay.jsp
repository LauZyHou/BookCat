<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
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
    <link href="../WEB-RELY/iCheck/blue.css" rel="stylesheet">
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
    <link rel="stylesheet" href="../main/pay.css">
    <script src="../main/pay.js"></script>
    <title>付款</title>
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
            <input type="text" class="form-control" placeholder="用户/书籍/文章">
            <button class="btn btn-primary" type="button"><i class="fa fa-search" aria-hidden="true"></i></button>
        </div>
    </form>
    <!--导航栏中的导航组-->
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link" href="../main/hot.jsp">热门</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="../main/classify.jsp">分类</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="../main/pay.jsp">付款</a>
        </li>
        <!--下拉组-->
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                设置
            </a>
            <div class="dropdown-menu">
                <a class="dropdown-item" href="../setting/selfmsg.jsp">个人资料</a>
                <a class="dropdown-item" href="../setting/cardsale.jsp">优惠卡券</a>
                <a class="dropdown-item" href="#">购买记录</a>
            </div>
        </li>
    </ul>
</nav>
<header>
    <!--左上角图标和字-->
    <div id="logandword">
        <div class="logobox">
            <img src="../WEB-PIC/Icon/cat1.svg">
        </div>
        <div class="nextbox">
            <h2>书猫商城</h2>
            <h4>www.bookcat.com</h4>
        </div>
        <div class="thirdbox">
            <h3>确认订单信息</h3>
        </div>
        <div class="rgtbox">
            <h4>全国免费服务热线</h4>
            <h3>188-0020-1312</h3>
        </div>
    </div>
    <hr id="tophr">
</header>
<article>
    <!--(1)确认收货地址-->
    <div class="mybox" id="addressbox">
        <div>
            <h4>1.确认收货信息</h4>
            <a href="#"><h5>修改收货信息</h5></a>
        </div>
        <h4>上海市 宝山区 聚丰园路88号 上海大学(宝山校区) 刘知昊收</h4>
        <h4>18800201312</h4>
        <button class="btn btn-primary">信息无误</button>
    </div>
    <!--(2)使用优惠券-->
    <div class="mybox" id="salebox">
        <div>
            <h4>2.选择优惠券</h4>
            <a href="#"><h5>选择优惠券</h5></a>
        </div>
        <h4>一张简单有效的的[风吹草动卡]</h4>
        <button class="btn btn-primary">确认使用</button>
    </div>
    <!--(3)从购物车中选择要购买的商品-->
    <s:form>
    <div class="mybox" id="bookbox">
        <div>
            <h4>3.从购物车中选择商品</h4>
            <a href="#"><h5>全选</h5></a>
            <a href="#"><h5>反选</h5></a>
        </div>
<%
    for(int i=1;i<7;i++){
%>
        <div>
            <button class="button button-caution button-square flybtn"><i class="fa fa-remove"></i></button>
            <div class="picbox">
                <img src="../WEB-PIC/Exhibition/<%=i%>.jpg">
            </div>
            <div class="dobox">
                <br><br>
                <h4>5本</h4>
                <br>
                <label for="<%=i%>">选择</label>
                <input type="checkbox" name="iCheck" id="<%=i%>">
            </div>
            <div class="wordbox">
                <h4>道德情操论</h4>
                <h5>&nbsp;&nbsp;在该书中，斯密用同情的基本原理来阐释正义、仁慈、克己等一切道德情操产生的根源，说明道德评价的性质、原则以及各种美德的特征，并对各种道德哲学学说进行了介绍和评价，进而揭示出人类社会赖以维系、和谐发展的基础以及人的行为应遵循的一般道德准则。</h5>
            </div>
        </div>
<%
    }
%>
        <button class="btn btn-primary">确认选择</button>
    </div>
    </s:form>
    <!--(4)生成订单-->
    <div class="mybox" id="orderbox">
        <div>
            <h4>4.生成订单</h4>
            <a href="#"><h5>我还有反悔的余地吗?</h5></a>
        </div>
        <h4>[订单编号]17</h4>
        <button class="btn btn-success">立即付款</button>
    </div>
</article>
<!--页脚-->
<footer>
    BookCat-让文字点亮你的生活！<br>
    关于我们 · 联系我们 · 加入我们 · 服务声明 · 友情链接 · 网站地图 · 移动应用
</footer>
</body>
</html>
