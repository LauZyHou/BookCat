<%@ page import="java.util.Map" %>
<%@ page import="com.opensymphony.xwork2.ActionContext" %>
<%@ page import="org.model.Book" %>
<%@ page import="java.util.List" %>
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
    <link rel="stylesheet" href="../other/srchrslt.css">
    <title>搜索结果</title>
</head>
<!---------------------------------------------------------------------------------------->
<body>
<!--导航栏-->
<s:include value="../sharing/navbar.jsp"/>

<%--用来存放取出模糊查询中book的信息--%>
<%
    int[] id=new int[20];
    String[] name=new String[20];
    String[] message=new String[20];
    int i=0;
    int k=0;
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
