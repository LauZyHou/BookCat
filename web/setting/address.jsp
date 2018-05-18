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
    <link rel="stylesheet" href="../setting/address.css">
    <!--标题-->
    <title>收货地址</title>
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
                <a class="dropdown-item" href="../setting/address.jsp">收货地址</a>
                <a class="dropdown-item" href="#">购买记录</a>
            </div>
        </li>
    </ul>
</nav>
<!--主体-->
<article>
    <!--用容器限高-->
    <div class="container">
        <!--地址切换头-->
        <div class="tabList">
            <div class="title">
                <h2>地址管理</h2>
                <p>赶快去解锁特殊地址吧</p>
            </div>
            <div id="tab">
                <h3 class="active">地址1</h3>
                <h3>地址2</h3>
                <h3>地址3</h3>
                <h3>VIP1</h3>
                <h3>VIP5</h3>
                <h3>年费读者</h3>
                <h3>认证作家</h3>
                <h3>一代宗师</h3>
            </div>
            <%--
            <ul class="nav nav-tabs" id="tabul">
                <li class="nav-item">
                    <a class="nav-link active" href="#">地址1</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">地址2</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">地址3</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">VIP1开启</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link disabled" href="#">VIP3开启</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link disabled" href="#">年费读者开启</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">认证作家开启</a>
                </li>
            </ul>
            --%>
        </div>
        <!--内容切换盒子-->
        <div id="tabBox">
            <div style="display: block">地址1</div>
            <div>地址2</div>
            <div>地址3</div>
            <div>VIP1</div>
            <div>VIP5</div>
            <div>年费读者</div>
            <div>认证作家</div>
        </div>
    </div>
</article>

</body>
<script>
    window.onload=function () {
        // 获取ul列表
        var tabul=document.getElementById("tabul");
        //获取列表中的li项数组
        var tabli=tabul.getElementsByTagName("li");
        //获取内容切换大盒子
        var tabBox=document.getElementById("tabBox");
        //获取大盒子中的子盒子数组
        var tabdiv=tabBox.getElementsByTagName("div");
        //对于ta头列表的每一项
        for(var i=0;i<tabli.length;i++){
            // 为其添加下标
            tabli[i].index=i;
            //为其添加点击事件
            tabli[i].onClick=function () {
                // 先将所有的都隐藏
                for(var i=0;i<tabli.length;i++){
                    tabli[i].className="";
                    tabdiv[i].style.display="none";
                }
                //再将自己激活
                this.className="active";
                tabdiv[this.index].style.display="block";
            }
        }
    }
</script>
</html>
