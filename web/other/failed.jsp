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
    <title>共用的失败界面</title>
</head>
<body>
<!--导航栏-->
<s:include value="../sharing/navbar.jsp"/>
    <h1>操作失败</h1>
    <h2>(请各位同学将失败条件触发的逻辑视图导向本页面)</h2>
    <h2>(我们将在本轮开发之后对操作失败后的行为进行处理)</h2>
</body>
</html>
