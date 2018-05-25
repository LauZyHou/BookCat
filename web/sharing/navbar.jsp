<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<!--导航栏部分-->
<nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
    <!--导航栏Logo-->
    <a class="navbar-brand" href="../main/main.jsp">BookCat</a>
    <!--导航栏表单-->
    <s:form class="form-inline" action="/search" id="srch">
        <div class="input-group">
            <!--在输入框前添加小标签-->
            <span class="input-group-addon">搜索</span>
            <!--输入框-->
            <input type="text" class="form-control" placeholder="用户/书籍/文章" name="name">
            <a class="btn btn-primary" href="#" onclick="tosubmit()"><i class="fa fa-search" aria-hidden="true"></i></a>
        </div>
    </s:form>
    <!--导航栏中的导航组-->
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link" href="hot">热门</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="../main/classify.jsp">分类</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="../main/pay.jsp">付款</a>
        </li>
        <!--下拉组-->
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                我的
            </a>
            <div class="dropdown-menu">
                <a class="dropdown-item" href="selfmsg">个人资料</a>
                <a class="dropdown-item" href="../setting/cardsale.jsp">优惠卡券</a>
                <a class="dropdown-item" href="../other/history.jsp">购买记录</a>
                <a class="dropdown-item" href="../other/leave.jsp">我的留言</a>
            </div>
        </li>
    </ul>
</nav>