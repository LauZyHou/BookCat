<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <link rel="stylesheet" href="../main/pay.css">
    <script src="../main/pay.js"></script>
    <title>付款</title>
</head>
<!---------------------------------------------------------------------------------------->
<body>
<!--导航栏-->
<s:include value="../sharing/navbar.jsp"/>
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
            <h4 id="ttl1">1.确认收货信息</h4>
            <a href="#" id="a1"><h5>修改收货信息</h5></a>
        </div>
        <h4 class="step1">上海市 宝山区 聚丰园路88号 上海大学(宝山校区) 刘知昊收</h4>
        <h4 class="step1">18800201312</h4>
        <button class="btn btn-primary" id="btn1" onclick="msgOk()">信息无误</button>
    </div>
    <!--(2)使用优惠券-->
    <div class="mybox" id="salebox">
        <div>
            <h4 id="ttl2">2.选择优惠券</h4>
            <a href="#" id="a2"><h5>选择优惠券</h5></a>
        </div>
        <h4 id="step2">一张简单有效的的[风吹草动卡]</h4>
        <button class="btn btn-primary" id="btn2" onclick="saleOk()">确认使用</button>
    </div>
    <!--(3)从购物车中选择要购买的商品-->
    <s:form>
    <div class="mybox" id="bookbox">
        <div>
            <h4>3.从购物车中选择商品</h4>
            <a href="#" onclick="chkall()"><h5>全选</h5></a>
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
