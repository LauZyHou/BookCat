<%@ page import="org.model.Book" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
    <!--外部共用-->
    <s:include value="../sharing/extern.jsp"/>
    <!--购物车-->
    <link rel="stylesheet" href="../sharing/shopcar.css">
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
            <a href="classify?category=1">计算机</a><br>
            <a href="classify?category=2">物理学</a><br>
            <a href="classify?category=3">生命科学</a><br>
            <a href="classify?category=4">数学</a><br>
            <a href="classify?category=5">电子/通信</a><br>
            <a href="classify?category=6">设计</a><br>
            <a href="classify?category=7">其它</a><br>
        </div>
        <div class="bigtype">
            <h3>
                政治
                <i class="fa fa-money" aria-hidden="true"></i>
                经济
            </h3>
            <hr>
            <a href="classify?category=8">贸易</a><br>
            <a href="classify?category=9">国际/国家</a><br>
            <a href="classify?category=10">城市建设</a><br>
            <a href="classify?category=11">其它</a><br>
        </div>
        <div class="bigtype">
            <h3>
                文学
                <i class="fa fa-paint-brush" aria-hidden="true"></i>
                艺术
            </h3>
            <hr>
            <a href="classify?category=12">行为艺术</a><br>
            <a href="classify?category=13">雕塑</a><br>
            <a href="classify?category=14">经典文学</a><br>
            <a href="classify?category=15">绘画</a><br>
            <a href="classify?category=16">艺术理论</a><br>
            <a href="classify?category=17">音乐</a><br>
            <a href="classify?category=18">其它</a><br>
        </div>
        <div class="bigtype">
            <h3>
                生活
                <i class="fa fa-heartbeat" aria-hidden="true"></i>
                情感
            </h3>
            <hr>
            <a href="classify?category=19">励志</a><br>
            <a href="classify?category=20">职业规划</a><br>
            <a href="classify?category=21">烹饪/美食</a><br>
            <a href="classify?category=22">室内装潢</a><br>
            <a href="classify?category=23">旅游</a><br>
            <a href="classify?category=24">爱情</a><br>
            <a href="classify?category=25">其它</a><br>
        </div>
        <div class="bigtype">
            <h3>
                教育
                <i class="fa fa-linode" aria-hidden="true"></i>
                考试
            </h3>
            <hr>
            <a href="classify?category=26">儿童教育</a><br>
            <a href="classify?category=27">小学</a><br>
            <a href="classify?category=28">中学</a><br>
            <a href="classify?category=29">竞赛教育</a><br>
            <a href="classify?category=30">考证</a><br>
            <a href="classify?category=31">特殊教育</a><br>
            <a href="classify?category=32">其它</a><br>
        </div>
    </div>

    <!--分类头-->
    <div id="taglist_hd">
        <%--<h2>Advertising space! Call 18800201312.</h2>--%>
        <a href="choice?choicevalue=0" class="button button-primary">按热度</a>
        <a href="choice?choicevalue=1" class="button">按价格</a>
    </div>
    <!--分类主体-->
    <div id="taglist_bd">
        <div class="rowbox clearfloat">
            <%
                int i = 0;
                int maxp = 4;//****
                int pagenumber = 1;
                if (request.getParameter("pagenumber") != null) {
                    pagenumber = Integer.parseInt(request.getParameter("pagenumber"));
                }
                List<Book> bkclist = (List<Book>) session.getAttribute("bkclist");
                int bksize = 0;
                if (bkclist == null) {
                    bksize = 0;
                } else {
                    bksize = bkclist.size();
                }
                if (pagenumber <= 0) {
                    pagenumber = 1;
                }
                System.out.print((bksize / maxp) + 1);
                if (pagenumber > (bksize / maxp) + 1) {
                    pagenumber = (bksize / maxp) + 1;
                }
                if (bkclist != null) {
                    for (int j = 0; j < maxp; j++) {
                        if ((pagenumber - 1) * maxp + j < bksize) {
                            int nowid=bkclist.get((pagenumber-1)*maxp+j).getId();
            %>
            <a class="imgbox" href="bkmsg?id=<%=nowid%>">
                <img src="../WEB-PIC/Exhibition/<%=nowid%>.jpg"/>
            </a>
            <%
                    }
                }
                i++;
                if (i == maxp)
                    if (i % 3 == 0) {
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
            <li class="page-item"><a class="page-link" href="../main/classify.jsp?pagenumber=1">首页</a></li>
            <li class="page-item"><a class="page-link" href="../main/classify.jsp?pagenumber=<%=pagenumber-1%>">上一页</a>
            </li>
            <li class="page-item"><a class="page-link" href="../main/classify.jsp?pagenumber=<%=pagenumber+1%>">下一页</a>
            </li>
            <li class="page-item"><a class="page-link"
                                     href="../main/classify.jsp?pagenumber=<%=(bksize/maxp)+1%>">尾页</a></li>
        </ul>
    </div>
</article>
<!--购物车-->
<s:include value="../sharing/shopcar.jsp"/>
<!--页脚-->
<footer>
    BookCat-让文字点亮你的生活！<br>
    关于我们 · 联系我们 · 加入我们 · 服务声明 · 友情链接 · 网站地图 · 移动应用
</footer>
</body>
</html>
