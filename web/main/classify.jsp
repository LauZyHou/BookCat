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
    <link rel="stylesheet" href="../main/classify.css">
    <title>图书分类</title>
</head>
<!---------------------------------------------------------------------------------------->
<body>
<!--导航栏-->
<s:include value="../sharing/navbar.jsp"/>
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
