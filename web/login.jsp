<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>登录页面</title>
</head>
<body>
<s:form action="login" method="post">
    <table>
        <tr>
            <td>用户名:</td>
            <!-- 在这里通过属性注入给LoginAction -->
            <td><s:textfield name="usrname" /></td>
        </tr>
        <tr>
            <td>密码:</td>
            <td><s:password name="password" /></td>
        </tr>
        <tr>
            <td colspan="2"><s:submit value="登录"/></td>
        </tr>
    </table>
</s:form>
</body>
</html>