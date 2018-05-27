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
    <link rel="stylesheet" href="../main/paymodal.css">
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
            <h2>书猫社区</h2>
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
            <a href="javascript:void(0);" onclick="getModal1()" id="a1"><h5>修改收货信息</h5></a>
        </div>
        <h4 class="step1" id="stp1_1">上海市 宝山区 聚丰园路88号 上海大学(宝山校区) 刘知昊收</h4>
        <h4 class="step1" id="stp1_2">18800201312</h4>
        <button class="btn btn-primary" id="btn1" onclick="msgOk()">信息无误</button>
    </div>
    <!--(2)使用优惠券-->
    <div class="mybox" id="salebox">
        <div>
            <h4 id="ttl2">2.选择优惠券</h4>
            <a href="javascript:void(0);" id="a2" onclick="getModal2()"><h5>选择优惠券</h5></a>
        </div>
        <h4 id="stp2_1">一张简单有效的的[风吹草动卡]</h4>
        <button class="btn btn-primary" id="btn2" onclick="saleOk()" disabled>确认使用</button>
    </div>
    <!--(3)从购物车中选择要购买的商品-->
    <%--<s:form action="">--%>
    <div class="mybox" id="bookbox">
        <div>
            <h4>3.从购物车中选择商品</h4>
            <a href="javascript:void(0);" onclick="chckall()" id="chckall"><h5>全选</h5></a>
            <a href="javascript:void(0);" onclick="chckrsrv()" id="chckrsrv"><h5>反选</h5></a>
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
                <input type="checkbox" name="iCheck" id="<%=i%>" class="chckbx">
            </div>
            <div class="wordbox">
                <h4>道德情操论</h4>
                <h5>&nbsp;&nbsp;在该书中，斯密用同情的基本原理来阐释正义、仁慈、克己等一切道德情操产生的根源，说明道德评价的性质、原则以及各种美德的特征，并对各种道德哲学学说进行了介绍和评价，进而揭示出人类社会赖以维系、和谐发展的基础以及人的行为应遵循的一般道德准则。</h5>
            </div>
        </div>
<%
    }
%>
    <button class="btn btn-primary" onclick="bookOk()" id="btn3" disabled>确认选择</button>
    </div>
    <%--</s:form>--%>
    <!--(4)生成订单-->
    <div class="mybox" id="orderbox" style="display: none;">
        <div>
            <h4>4.生成订单</h4>
            <a href="javascript:void(0);" onclick="window.alert('没有');"><h5>我还有反悔的余地吗?</h5></a>
        </div>
        <h4>[订单编号]15121856</h4>
        <button class="btn btn-success">立即付款</button>
    </div>
</article>
<!--页脚-->
<footer>
    BookCat-让文字点亮你的生活！<br>
    关于我们 · 联系我们 · 加入我们 · 服务声明 · 友情链接 · 网站地图 · 移动应用
</footer>
<!--模态框-->
<s:include value="../main/paymodal.jsp"/>
<script>
// AJAX回调函数
var xmlhttp;
function loadXMLDoc(url,cfunc)
{
    console.log("load开始");
    if (window.XMLHttpRequest)
    {
        // IE7+,Firefox,Chrome,Opera,Safari
        xmlhttp=new XMLHttpRequest();
    }
    else
    {
        // IE6,IE5
        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    }
    // 将状态触发器绑定到指定的处理函数
    xmlhttp.onreadystatechange=cfunc;
    xmlhttp.open("GET",url,true);
    xmlhttp.send();
    console.log("load结束");
}


// [1]收货信息确认按下时
function msgOk()
{
    console.log('按下');
    //用EL表达式向ajax后端传值
    loadXMLDoc("/msgOk.servlet?address="+$('#stp1_1').text()+"&tel="+$('#stp1_2').text(),msgOKProcessor);
    console.log("结束");
}

//[1][!]收货信息确认的处理函数,用于绑定给触发器
function msgOKProcessor() {
    var responseContext;
    console.log('状态改变为'+xmlhttp.readyState+','+xmlhttp.status);
    //如果返回成功并取得了响应内容
    if(4===xmlhttp.readyState && 200===xmlhttp.status){
        console.log('完毕');
        responseContext=xmlhttp.responseText;
        if(responseContext=='-1'){
            window.alert('请先登录');
        }
        else{
            //结束后的js操作
            //颜色变化
            console.log('啊啊啊');
            var h_lst=document.getElementsByClassName("step1");
            for(var i=0;i<h_lst.length;i++){
                h_lst[i].style.backgroundColor="#b9e563";
                h_lst[i].style.color="#000000";
            }
            // 按钮不可用
            document.getElementById("btn1").disabled=true;
            document.getElementById("btn1").innerText="-已确认-";
            // 超链接移除
            var a1=document.getElementById("a1");
            a1.parentNode.removeChild(a1);
            document.getElementById("ttl1").innerText="1.确认收货信息(已确认)";
            // 屏幕缓动
            var h=$('header').height();
            $('html,body').animate({scrollTop: h}, 800);
            // 优惠券确认按钮可用
            $('#btn2').attr('disabled',false);
        }
    }
}


// [2]优惠券确认按下时
function saleOk() {
    document.getElementById("stp2_1").style.backgroundColor="#b9e563";
    document.getElementById("stp2_1").style.color="#000000";
    // 按钮不可用
    document.getElementById("btn2").disabled=true;
    document.getElementById("btn2").innerText="-已选择-";
    // 超链接移除
    var a2=document.getElementById("a2");
    a2.parentNode.removeChild(a2);
    document.getElementById("ttl2").innerText="2.选择优惠券(已选择)";
    // 屏幕缓动
    var h=$('header').height()+$('#addressbox').height();
    $('html,body').animate({scrollTop: h}, 800);
    // 购物车确认可用
    $('#btn3').attr('disabled',false);
}
</script>
</body>
</html>
