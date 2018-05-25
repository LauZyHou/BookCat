<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
    <!--外部共用-->
    <s:include value="../sharing/extern.jsp"/>
    <!--导航栏样式和动作-->
    <link rel="stylesheet" href="../sharing/navbar.css">
    <script src="../sharing/navbar.js"></script>
    <!--自定-->
    <link rel="stylesheet" href="../setting/cardsale.css">
    <!--标题-->
    <title>收货地址</title>
</head>
<!---------------------------------------------------------------------------------------->
<body>
<!--导航栏-->
<s:include value="../sharing/navbar.jsp"/>
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
