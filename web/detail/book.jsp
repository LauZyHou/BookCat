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
    <!--页脚样式-->
    <link rel="stylesheet" href="../sharing/footer.css">
    <!--自定-->
    <link rel="stylesheet" href="../detail/book.css">
    <title>书籍页面</title>
</head>
<!---------------------------------------------------------------------------------------->
<body>
<!--导航栏-->
<s:include value="../sharing/navbar.jsp"/>
<header>
    <div id="ttlbox">
        数据库实用教程
    </div>
    <div>
        <div id="picbox">
            <img src="../WEB-PIC/Exhibition/7.jpg"/>
        </div>
        <a href="#" class="btn btn-primary"><p>立<br>即<br>添<br>加</p></a>
        <a href="https://read.douban.com" class="btn btn-success" target="_blank"><p>在<br>线<br>试<br>读</p></a>
        <div id="wordbox">
            C++是在C语言基础上开发的一种集面向对象编程、通用编程和传统的过程化编程于一体的编程语言，是C语言的超集。本书是根据2003年的ISO/ANSI C++标准编写的。通过大量短小...
        </div>
    </div>
</header>
<article>
    <!--已经存在的留言-->
    <div class="exist exist-A">
        <div class="usrpicbox">
            <img src="../WEB-PIC/User/1.jpg"/>
        </div>
    </div>
    <div class="exist exist-B">
        <div class="usrpicbox">
            <img src="../WEB-PIC/User/2.jpg"/>
        </div>
    </div>
    <!--留言相关-->
    <div id="leave">
        <!--提交留言表单-->
        <s:form>
            <s:textarea/>
            <div>
                <s:reset class="btn btn-secondary" name="" value="重置"/>
                <s:submit class="btn btn-primary" name="ok" value="提交"/>
            </div>
        </s:form>
    </div>
</article>
<!--购物车-->
<s:include value="../sharing/shopcar.jsp"/>
<!--尾标-->
<s:include value="../sharing/footer.jsp"/>
</body>
</html>
