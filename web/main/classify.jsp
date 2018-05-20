<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
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
    <script src="../WEB-RELY/icheck.min.js"></script>
    <!--字体的CDN-->
    <link href='http://cdn.webfont.youziku.com/webfonts/nomal/117834/19650/5af08244f629d8100cf43a22.css'
          rel='stylesheet' type='text/css'>
    <link href='http://cdn.webfont.youziku.com/webfonts/nomal/117834/45817/5af08133f629d8100cf43a20.css'
          rel='stylesheet' type='text/css'>
    <!--FontAwesome图标库-->
    <link rel="stylesheet" href="../WEB-RELY/font-awesome-4.7.0/css/font-awesome.min.css">
    <!--自定-->
    <link rel="stylesheet" href="../main/classify.css">
    <!--标题-->
    <title>图书分类</title>
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
<!--主体-->
<article>
    <!--分类-->
    <div id="taglist">
        <div class="bigtype">
            <h3>
                科学
                <i class="fa fa-cogs" aria-hidden="true"></i>
                技术
            </h3>
            <hr>
            <a href="#">计算机</a><br>
            <a href="#">物理学</a><br>
            <a href="#">生命科学</a><br>
            <a href="#">数学</a><br>
            <a href="#">电子/通信</a><br>
            <a href="#">设计</a><br>
            <a href="#">其它</a><br>
        </div>
        <div class="bigtype">
            <h3>
                政治
                <i class="fa fa-money" aria-hidden="true"></i>
                经济
            </h3>
            <hr>
            <a href="#">贸易</a><br>
            <a href="#">国际/国家</a><br>
            <a href="#">城市建设</a><br>
            <a href="#">其它</a><br>
        </div>
        <div class="bigtype">
            <h3>
                文学
                <i class="fa fa-paint-brush" aria-hidden="true"></i>
                艺术
            </h3>
            <hr>
            <a href="#">行为艺术</a><br>
            <a href="#">雕塑</a><br>
            <a href="#">经典文学</a><br>
            <a href="#">绘画</a><br>
            <a href="#">艺术理论</a><br>
            <a href="#">音乐</a><br>
            <a href="#">其它</a><br>
        </div>
        <div class="bigtype">
            <h3>
                生活
                <i class="fa fa-heartbeat" aria-hidden="true"></i>
                情感
            </h3>
            <hr>
            <a href="#">励志</a><br>
            <a href="#">职业规划</a><br>
            <a href="#">烹饪/美食</a><br>
            <a href="#">室内装潢</a><br>
            <a href="#">旅游</a><br>
            <a href="#">爱情</a><br>
            <a href="#">其它</a><br>
        </div>
        <div class="bigtype">
            <h3>
                教育
                <i class="fa fa-linode" aria-hidden="true"></i>
                考试
            </h3>
            <hr>
            <a href="#">儿童教育</a><br>
            <a href="#">小学</a><br>
            <a href="#">中学</a><br>
            <a href="#">竞赛教育</a><br>
            <a href="#">考证</a><br>
            <a href="#">特殊教育</a><br>
            <a href="#">其它</a><br>
        </div>
    </div>
    <!--分类头-->
    <div id="taglist_hd">
        <h2>Advertising space! Call 18800201312.</h2>
        <a href="#" class="button button-primary">按热度</a>
        <a href="#" class="button">按价格</a>
    </div>
    <!--分类主体-->
    <div id="taglist_bd">
        <div class="rowbox clearfloat">
<%
            for(int i=1;i<=14;i++){
%>
                <a class="imgbox" href="#">
                    <img src="../WEB-PIC/Exhibition/<%=i%>.jpg">
                </a>
<%
                if(i%4==0){
%>
        </div>
        <div class="rowbox clearfloat">
<%
                }
            }
%>
        </div>
    </div>
    <!--分页-->
    <div id="page">
        <ul class="pagination pagination-lg">
            <li class="page-item"><a class="page-link" href="#">Previous</a></li>
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#">Next</a></li>
        </ul>
    </div>
</article>
<!--购物车-->
<img src="../WEB-PIC/Icon/shopcar.svg" id="shopcar">
<!--购物车上的小圆点-->
<button class="button button-raised button-action button-circle button-caution" id="circle">1</button>
<!--页脚-->
<footer>
    BookCat-让文字点亮你的生活！<br>
    关于我们 · 联系我们 · 加入我们 · 服务声明 · 友情链接 · 网站地图 · 移动应用
</footer>
</body>
</html>
