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
    <script src="../main/pay.js"></script>
    <title>我的留言</title>
</head>
<!---------------------------------------------------------------------------------------->
<body>
<!--导航栏-->
<s:include value="../sharing/navbar.jsp"/>
<header>
    <h1>我的留言</h1>
</header>
<article>
    <s:form>

        <table class="table table-hover table-primary">
            <tr>
                <th>留言编号</th>
                <th>留言内容(开头)</th>
                <th>留言时间</th>
                <th>明细</th>
            </tr>

            <%
                Date day=new Date();
                SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//                for(int i=1;i<10;i++){
                int i=0;
            %>
            <s:iterator value="#session.uleaves" id="leave" status="st">
            <tr>
                <td>00<%=i+1%></td>
                <td>
                    <s:property value="#leave.comments"/>
                </td>
                <td><s:property value="#leave.time"/></td>
                <td><a class="btn btn-primary" href="#">明细</a></td>
            </tr>

            <%
                i++;
//                }
            %>
            </s:iterator>
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
