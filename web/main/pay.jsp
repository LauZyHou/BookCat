<%@ page import="org.model.User" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="org.model.Book" %>
<%@ page import="java.util.List" %>
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
<!---------------------------------------------------------------------------------------->
<article>
<!---------------------------------------------------------------------------------------->
    <!--(1)确认收货地址-->
    <div class="mybox" id="addressbox">
        <div>
            <h4 id="ttl1">1.确认收货信息</h4>
            <a href="javascript:void(0);" onclick="getModal1()" id="a1"><h5>修改收货信息</h5></a>
        </div>
        <h4 class="step1" id="stp1_1"><s:property value="#session.usr.address"/></h4>
        <h4 class="step1" id="stp1_2"><s:property value="#session.usr.tel"/></h4>
        <button class="btn btn-primary" id="btn1" onclick="msgOk()">信息无误</button>
    </div>
<!---------------------------------------------------------------------------------------->
    <!--(2)使用优惠券-->
    <div class="mybox" id="salebox">
        <div>
            <h4 id="ttl2">2.选择优惠券</h4>
            <a href="javascript:void(0);" id="a2" onclick="getModal2()"><h5>选择优惠券</h5></a>
        </div>
        <h4 id="stp2_1">一张简单有效的的[风吹草动卡]</h4>
        <button class="btn btn-primary" id="btn2" onclick="saleOk()" disabled>确认使用</button>
    </div>
<!---------------------------------------------------------------------------------------->
    <!--(3)从购物车中选择要购买的商品-->
    <%--<s:form action="">--%>
    <div class="mybox" id="bookbox">
        <div>
            <h4>3.从购物车中选择商品</h4>
            <a href="javascript:void(0);" onclick="chckall()" id="chckall"><h5>全选</h5></a>
            <a href="javascript:void(0);" onclick="chckrsrv()" id="chckrsrv"><h5>反选</h5></a>
        </div>
<!---------------------------------------------------------------------------------------->
<%
        User user=(User)session.getAttribute("usr");
        Map map=(Map)application.getAttribute("usrid"+user.getId());
        Iterator<Map.Entry<Integer, Integer>> entries = map.entrySet().iterator();
        List<Book> book_l=(List<Book>)session.getAttribute("book_l");
        int i=0;
        while (entries.hasNext()) {
            Map.Entry<Integer, Integer> entry = entries.next();
%>
        <div id="bkrowdv<%=entry.getKey()%>">
            <button class="button button-caution button-square flybtn" onclick="clkFly(<%=entry.getKey()%>)">
                <i class="fa fa-remove"></i>
            </button>
            <div class="picbox">
                <img src="/pic/Exhibition/<%=entry.getKey()%>.jpg">
            </div>
            <div class="dobox">
                <br><br>
                <h4><%=entry.getValue()%></h4>
                <br>
                <label for="<%=entry.getKey()%>">选择</label>
                <input type="checkbox" name="iCheck" id="chk<%=entry.getKey()%>" class="chckbx">
            </div>
            <div class="wordbox">
                <h4><%=book_l.get(i).getName()%></h4>
                <h5>&nbsp;&nbsp;<%=book_l.get(i).getMsg()%></h5>
            </div>
        </div>
<%
            i++;
        }
%>
<!---------------------------------------------------------------------------------------->
    <button class="btn btn-primary" onclick="bookOk()" id="btn3" disabled>确认选择</button>
    </div>
<!---------------------------------------------------------------------------------------->
    <!--(4)生成订单-->
    <div class="mybox" id="orderbox" style="display: none;">
        <div>
            <h4>4.生成订单</h4>
            <a href="javascript:void(0);" onclick="window.alert('没有');"><h5>我还有反悔的余地吗?</h5></a>
        </div>
        <h4 id="stp4_1">[订单编号]</h4>
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

<!---------------------------------------------------------------------------------------->

// [1]收货信息确认按下时
function msgOk()
{
    //向ajax后端传值
    loadXMLDoc("/msgOk.servlet?address="+$('#stp1_1').text()+"&tel="+$('#stp1_2').text(),msgOKProcessor);
}

//处理<[1]收货信息确认>
function msgOKProcessor() {
    var responseContext;
    console.log('[1]状态改变为'+xmlhttp.readyState+','+xmlhttp.status);
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

<!---------------------------------------------------------------------------------------->

//[2]优惠券确认按下时
function saleOk() {
    //向ajax后端传值
    loadXMLDoc("/saleOk.servlet?card="+$('input:radio:checked').val(), saleOKProcessor);
}

//处理<[2]优惠券确认按下>
function saleOKProcessor() {
    var responseContext;
    console.log('[2]状态改变为' + xmlhttp.readyState + ',' + xmlhttp.status);
    //如果返回成功并取得了响应内容
    if (4 === xmlhttp.readyState && 200 === xmlhttp.status) {
        console.log('完毕');
        responseContext = xmlhttp.responseText;
        if (responseContext == '-1') {
            window.alert('请先登录');
        }
        else if(responseContext == '-2'){
            window.alert('该卡片数量为0');
        }
        else {
            document.getElementById("stp2_1").style.backgroundColor = "#b9e563";
            document.getElementById("stp2_1").style.color = "#000000";
            // 按钮不可用
            document.getElementById("btn2").disabled = true;
            document.getElementById("btn2").innerText = "-已选择-";
            // 超链接移除
            var a2 = document.getElementById("a2");
            a2.parentNode.removeChild(a2);
            document.getElementById("ttl2").innerText = "2.选择优惠券(已选择)";
            // 屏幕缓动
            var h = $('header').height() + $('#addressbox').height();
            $('html,body').animate({scrollTop: h}, 800);
            // 购物车确认可用
            $('#btn3').attr('disabled', false);
        }
    }
}

<!---------------------------------------------------------------------------------------->
    
//[3.1]按下红色移除按钮时
function clkFly(bookid) {
    //向ajax后端传值
    loadXMLDoc("/dealCar.servlet?deal=rmv&id="+bookid, clkFlyProcessor);
}

//处理<[3.1]按下红色移除按钮>
function clkFlyProcessor() {
    var responseContext;
    console.log('[3.1]状态改变为' + xmlhttp.readyState + ',' + xmlhttp.status);
    //如果返回成功并取得了响应内容
    if (4 === xmlhttp.readyState && 200 === xmlhttp.status) {
        responseContext=xmlhttp.responseText;
        if("-1"==responseContext){
            window.alert("已经掉线啦,请重新登录");
        }else if("-2"==responseContext){
            window.alert("啊哦,购物车不见了,请重新建立购物车~");
        }else if("-3"==responseContext){
            window.alert("啊哦,购物车是空的,请刷新页面后重新添加~");
        }else if("-4"==responseContext){
            window.alert("[!]deal或id未能获得");
        }else if("-5"==responseContext){
            window.alert("[!]购物车中不存在的书籍号(id)");
        }else if("-6"==responseContext){
            window.alert("[!]不存在的操作方式(deal的值)");
        }else{
            //获取2个值的数组,分别是操作的书的id和操作后的值
            var arry_idAndNum=responseContext.split(" ");
            //判定操作后的值
            //如果第二个字段为-1表示确实做了移除
            if("-1"==arry_idAndNum[1]){
                // FIXME
                var rmv=document.getElementById("bkrowdv"+arry_idAndNum[0]);
                rmv.parentNode.removeChild(rmv);
            }else{
                window.alert("[!]移除失败");
            }
        }
    }
}

<!---------------------------------------------------------------------------------------->

// [3.2]购物车中的商品确认
function bookOk(){
    //获得所有确认选项的直接父盒子们
    var itrt=document.getElementsByClassName('dobox');
    //每个游标,对应的含样式的多选按钮,是否选中
    var i;
    //存放选中的书的id的数组
    var chkbkid_arry=[];
    //这个字符串用于合成所有的值
    var ids_str;
    //遍历页面上的所有书的dobox盒子
    for(i=0;i<itrt.length;i++){
        //获取最后一个直接孩子,即多选按钮
        var it=itrt[i].lastElementChild;
        //通过是否含有某class判定其是否选中
        var tf=it.classList.contains('checked');
        //如果是选中的
        if(tf){
            //获取其id值
            var id=it.firstElementChild.id;
            //从id中获取选中书的编号,加入到数组中
            chkbkid_arry.push(id.split('chk')[1]);
        }
    }
    //将选中的那些书的id合成成一个字符串
    ids_str=chkbkid_arry.join(" ");
    //向ajax后端传值
    loadXMLDoc("/gnrtOrdr.servlet?ids_str="+ids_str, bookOkProcessor);
    console.log("bookOk Over");
}


//处理<[3.2]购物车中的商品确认>
function bookOkProcessor() {
    var responseContext;
    console.log('[3.2]状态改变为' + xmlhttp.readyState + ',' + xmlhttp.status);
    //如果返回成功并取得了响应内容
    if (4 === xmlhttp.readyState && 200 === xmlhttp.status) {
        responseContext = xmlhttp.responseText;
        if ("-1" == responseContext) {
            window.alert("已经掉线啦,请重新登录");
        } else if ("-2" == responseContext) {
            window.alert("啊哦,购物车不见了,请重新建立购物车~");
        } else if ("-3" == responseContext) {
            window.alert("啊哦,购物车是空的,请刷新页面后重新添加~");
        } else if ("-4" == responseContext) {
            window.alert("[!]参数ids_str未能获得");
        } else {
            // 设置不可选
            $('.chckbx').iCheck('disable');
            // 设置从购物车删除不可用
            $('.flybtn').attr('disabled', true);
            // 移除全选和反选
            $('#chckall,#chckrsrv').remove();
            // 按钮不可用+按钮上文字提示改变
            $('#btn3').attr('disabled', true).text('-已完成-');
            // 该盒子文字提示改变
            $('#bookbox').children('div').children('h4').text('3.从购物车中选择商品(已完成)');
            //订单编号显示
            $('#stp4_1').text('[订单编号]' + responseContext);
            // 让生成订单的div显示
            $('#orderbox').css('display', 'block');
            // 屏幕滑到底
            var h = $(document).height() - $(window).height();
            // 缓缓滑动
            $('html,body').animate({scrollTop: h}, 800);
        }
    }
}

</script>
</body>
</html>
