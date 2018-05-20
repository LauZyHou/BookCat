<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--BootStrap依赖-->
    <link rel="stylesheet" href="../WEB-RELY/bootstrap.min.css">
    <script src="../WEB-RELY/jquery.min.js"></script>
    <script src="../WEB-RELY/popper.min.js"></script>
    <script src="../WEB-RELY/bootstrap.min.js"></script>
    <!--自定-->
    <link rel="stylesheet" href="../admin/login.css">
    <title>BookCat管理员登录</title>
</head>
<body>
<header>
    <h1>BookCat管理员登录</h1>
</header>
<article>
    <div class="container">
        <s:form action="/adminlogin" method="POST">
            <div class="form-group">
                <h4>管理员身份:</h4>
                <s:textfield name="name" class="form-control" placeholder="Enter admin user"/>
            </div>
            <div class="form-group">
                <h4>密码:</h4>
                <s:password name="password" class="form-control" placeholder="Enter password"/>
            </div>
            <s:submit class="btn btn-primary" value="登录"/>
        </s:form>
    </div>
</article>
<footer>

</footer>
</body>
</html>
