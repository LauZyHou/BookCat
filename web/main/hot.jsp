<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="org.model.Book" %>
<%@ page import="java.util.List" %>
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
    <link rel="stylesheet" href="../main/hot.css">
    <!--标题-->
    <title>热门书籍</title>
</head>
<!---------------------------------------------------------------------------------------->
<body>
<s:include value="../sharing/navbar.jsp"/>
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
            <a class="imgbox" href="bkmsg?id=<s:property value="#book.id"/>" target="_blank">
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
<s:include value="../sharing/shopcar.jsp"/>
<!--页脚-->
<footer>
    BookCat-让文字点亮你的生活！<br>
    关于我们 · 联系我们 · 加入我们 · 服务声明 · 友情链接 · 网站地图 · 移动应用
</footer>
</body>
</html>
