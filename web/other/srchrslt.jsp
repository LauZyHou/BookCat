<%@ page import="java.util.Map" %>
<%@ page import="com.opensymphony.xwork2.ActionContext" %>
<%@ page import="org.model.Book" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <!--文档字符编码为utf-8-->
    <meta charset="utf-8">
    <!--设定网页的布局:宽度为设备宽度,页面的初始缩放值为1-->
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <!--Buttons CSS按钮样式库-->
    <link href="../WEB-RELY/button.css" rel="stylesheet" type="text/css">
    <!--BootStrap依赖-->
    <link rel="stylesheet" href="../WEB-RELY/bootstrap.min.css">
    <script src="../WEB-RELY/jquery.min.js"></script>
    <script src="../WEB-RELY/popper.min.js"></script>
    <script src="../WEB-RELY/bootstrap.min.js"></script>
    <!--字体的CDN-->
    <link href='http://cdn.webfont.youziku.com/webfonts/nomal/117834/19650/5af08244f629d8100cf43a22.css'
          rel='stylesheet' type='text/css'>
    <link href='http://cdn.webfont.youziku.com/webfonts/nomal/117834/46121/5af9bad5f629d910dce29d2c.css'
          rel='stylesheet' type='text/css'>
    <link href='http://cdn.webfont.youziku.com/webfonts/nomal/117834/45817/5af08133f629d8100cf43a20.css'
          rel='stylesheet' type='text/css'>
    <!--FontAwesome图标库-->
    <link rel="stylesheet" href="../WEB-RELY/font-awesome-4.7.0/css/font-awesome.min.css">
    <!--自定-->
    <link rel="stylesheet" href="../other/srchrslt.css">
    <title>搜索结果</title>
</head>
<body>
<!--导航栏部分-->
<nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
    <!--导航栏Logo-->
    <a class="navbar-brand" href="../main/main.jsp">BookCat</a>

    <!--导航栏中的导航组-->
    <ul class="navbar-nav" >
        <!--下拉组-->
        <li class="nav-item dropdown" align="right">
            <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                我的
            </a>
            <div class="dropdown-menu">
                <a class="dropdown-item" href="../setting/selfmsg.jsp">个人资料</a>
                <a class="dropdown-item" href="../setting/cardsale.jsp">优惠卡券</a>
                <a class="dropdown-item" href="../other/history.jsp">购买记录</a>
                <a class="dropdown-item" href="../other/leave.jsp">我的留言</a>
            </div>
        </li>
    </ul>
</nav>

<div class="search form" >
    <form class="form-inline" action="search">
        <div class="input-group">
            <!--在输入框前添加小标签-->
            <span class="input-group-addon">搜 索</span>
            <!--输入框-->
            <input type="text" class="form-control" placeholder="书籍" name="name">
            <button class="btn btn-primary" type="submit"><i class="fa fa-search" aria-hidden="true"></i></button>
        </div>
    </form>
</div>

<%--用来存放取出模糊查询中book的信息--%>
<% int[] id=new int[20];
    String[] name=new String[20];
    String[] message=new String[20];
    int i=0;
    int k=0;
%>
<%
    Map sssn=ActionContext.getContext().getSession();
    List<Book> nbook=(List<Book>)sssn.get("book");
    for(Book book:nbook){
        id[i]=book.getId();
        name[i]=book.getName();
        message[i]=book.getMsg();
        i++;
    }
%>
<div class="result table" >
    <form class="form-inline" action="search">
        <table border="1">
            <tr>
                <th>id</th>
                <th>name</th>
                <th>msg</th>
            </tr>
            <%
                for(k=0;k<i;k++){
            %>
            <tr>
                <td><%=id[k]%></td>
                <td><%=name[k]%></td>
                <td><%=message[k]%></td>
            </tr>
            <%
                }
            %>

        </table>
    </form>
</div>

</body>
</html>
