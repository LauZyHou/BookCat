<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
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
    <link rel="stylesheet" href="../other/history.css">
    <script src="../other/history.js"></script>
    <title>购买记录</title>
</head>
<!---------------------------------------------------------------------------------------->
<body>
<!--导航栏-->
<s:include value="../sharing/navbar.jsp"/>
<header>
    <h1>购买记录</h1>
</header>
<article>
<s:form>
    <table class="table table-hover table-primary">
        <tr>
            <th>订单号</th>
            <th>总价</th>
            <th>下单时间</th>
            <th>明细</th>
        </tr>
<%
    Date day=new Date();
    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    for(int i=1;i<10;i++){
%>
        <tr>
            <td>00<%=i%></td>
            <td><%=50+i%></td>
            <td><%=df.format(day).toString()%></td>
            <td><a class="btn btn-primary" href="#">明细</a></td>
        </tr>
<%
    }
%>
    </table>
</s:form>
</article>
<!--页脚-->
<footer>
    BookCat-让文字点亮你的生活！<br>
    关于我们 · 联系我们 · 加入我们 · 服务声明 · 友情链接 · 网站地图 · 移动应用
</footer>
</body>
</html>
