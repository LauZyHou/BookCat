<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="org.model.Book" %>
<%@ page import="java.util.List" %>
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
    <link rel="stylesheet" href="../main/hot.css">
    <!--标题-->
    <title>热门书籍</title>
</head>
<!---------------------------------------------------------------------------------------->
<body>
<!--导航栏部分-->
<nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
    <!--导航栏Logo-->
    <a class="navbar-brand" href="../main/main.jsp">BookCat</a>
    <!--导航栏表单-->
    <s:form class="form-inline" action="/search" id="srch">
        <div class="input-group">
            <!--在输入框前添加小标签-->
            <span class="input-group-addon">搜索</span>
            <!--输入框-->
            <input type="text" class="form-control" placeholder="用户/书籍/文章" name="name">
            <a class="btn btn-primary" href="#" onclick="tosubmit()"><i class="fa fa-search" aria-hidden="true"></i></a>
        </div>
    </s:form>
    <!--导航栏中的导航组-->
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link" href="hot">热门</a>
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
                我的
            </a>
            <div class="dropdown-menu">
                <a class="dropdown-item" href="selfmsg">个人资料</a>
                <a class="dropdown-item" href="../setting/cardsale.jsp">优惠卡券</a>
                <a class="dropdown-item" href="../other/history.jsp">购买记录</a>
                <a class="dropdown-item" href="../other/leave.jsp">我的留言</a>
            </div>
        </li>
    </ul>
</nav>
<!--主体-->
<article>
<%
    //获取当前时间
    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String t = df.format(new java.util.Date());
    Timestamp ts = Timestamp.valueOf(t);
    Long tc=ts.getTime();
    List<Book> ht=(List<Book>) session.getAttribute("hbooks");
    //前三名打上Icon
    for(int i=0;i<14;i++){
%>

    <s:iterator value="#session.hbooks" id="book" status="st">
        <div class="bookbox">
<%
        if(i==1){
%>
            <img src="../WEB-PIC/Icon/red.svg" id="no1">
<%
        } else if(i==2){
%>
            <img src="../WEB-PIC/Icon/blue.svg" id="no2">
<%
        } else if(i==3){
 %>
            <img src="../WEB-PIC/Icon/green.svg" id="no3">
<%
        }
%>
            <a class="imgbox" href="#">
                <img src="../WEB-PIC/Exhibition/<s:property value="#book.id"/>.jpg">
            </a>
            <div class="msgbox">
                <h3>Top.<%=i+1%></h3>
                <h4><s:property value="#book.name"/></h4>
            <div>
<%
        //上架30天之内是新书
        if(((ts.getTime()/(1000*60*60*24))-(ht.get(i).getTime().getTime()/(1000*60*60*24)))<30){
            out.print(("<span class=\"badge badge-primary\">新书<br></span>"));
        } else{
            out.print(("<span class=\"badge badge-secondary\">经典<br></span>"));
        }
%>
        <s:if test="#book.num==0">
            <span class="badge badge-danger">售罄</span>
        </s:if>
        <s:elseif test="#book.num<35">
            <span class="badge badge-warning">即将售罄</span>
        </s:elseif>
<%
        i++;
%>
        </div>
            <p><s:property value="#book.msg"/></p>
        </div>
        </div>
    </s:iterator>
<%
    }
%>
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
