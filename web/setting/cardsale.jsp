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
    <link rel="stylesheet" href="../setting/cardsale.css">
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
                <a class="dropdown-item" href="../setting/cardsale.jsp">优惠卡券</a>
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
                <h2>优惠卡管理</h2>
                <p>赶快去获取高级优惠卡吧</p>
            </div>
            <div id="tab">
                <h3 class="active">风吹草动卡</h3>
                <h3>排山倒海卡</h3>
                <h3>宇宙星河卡</h3>
                <h3>卡牌合成</h3>
            </div>
        </div>
        <!--内容切换盒子-->
        <div id="tabBox">
            <div class="tabdiv" style="display: block">
                <div class="picdiv">
                    <img src="../WEB-PIC/Coupons/1.jpg">
                </div>
                <div class="describe">
                    <h4>卡牌描述</h4>
                    平淡无奇的卡牌，似乎隐约散发着一些微小的力量。
                    <hr>
                    <h4>卡牌效果</h4>
                    生成订单时使用该卡牌，能稳定打9.9折，取消订单归还卡牌。
                    <hr>
                    <h4>卡牌获取</h4>
                    可以通过签到、活动获取风吹草动卡。
                    <br>
                    您目前拥有48张风吹草动卡。
                </div>
            </div>
            <div class="tabdiv">
                <div class="picdiv">
                    <img src="../WEB-PIC/Coupons/2.jpg">
                </div>
                <div class="describe">
                    <h4>卡牌描述</h4>
                    充盈着力量的卡牌，周遭的一切都变得不安了起来。
                    <hr>
                    <h4>卡牌效果</h4>
                    生成订单时使用该卡牌，能稳定打9折，取消订单归还卡牌。
                    <hr>
                    <h4>卡牌获取</h4>
                    可以通过合成、活动获取排山倒海卡。
                    <br>
                    您目前拥有0张排山倒海卡。
                </div>
            </div>
            <div class="tabdiv">
                <div class="picdiv">
                    <img src="../WEB-PIC/Coupons/3.jpg">
                </div>
                <div class="describe">
                    <h4>卡牌描述</h4>
                    这卡的来历早已无从考究，上古时期挑战该卡的斗圣强者都已纷纷陨落。
                    <hr>
                    <h4>卡牌效果</h4>
                    生成订单时使用该卡牌，随机打7~9折，取消订单将使该卡破裂为2张风吹草动卡。
                    <hr>
                    <h4>卡牌获取</h4>
                    可以通过合成、活动获取宇宙星河卡。
                    <br>
                    您目前拥有0张宇宙星河卡。
                </div>
            </div>
            <div class="tabdiv">卡牌合成</div>
        </div>
    </div>
</article>

</body>
<script>
    window.onload=function () {
        // 获取tab头的列表
        var tab_ttl=document.getElementById("tab");
        //获取列表中的h3项数组
        var tab_lst=tab_ttl.getElementsByTagName("h3");
        //获取内容切换大盒子
        var tabBox=document.getElementById("tabBox");
        //获取大盒子中的子盒子数组
        var tabdiv=tabBox.getElementsByClassName("tabdiv");
        //对于ta头列表的每一项
        for(var i=0;i<tab_lst.length;i++){
            // 为其添加下标
            tab_lst[i].index=i;
            //为其添加点击事件
            tab_lst[i].onclick=function () {
                // 先将所有的都隐藏
                for(var j=0;j<tab_lst.length;j++){
                    tab_lst[j].className="";
                    tabdiv[j].style.display="none";
                }
                //再将自己激活
                this.className="active";
                tabdiv[this.index].style.display="block";
            };
        }
    };
</script>
</html>
