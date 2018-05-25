<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
    <!--外部共用-->
    <s:include value="../sharing/extern.jsp"/>
    <!--自定-->
    <link rel="stylesheet" href="../join/login.css">
    <script type="text/javascript" src="../join/login.js"></script>
    <!--标题-->
    <title>登录BookCat</title>
</head>
<!---------------------------------------------------------------------------------------->
<body>
<br>
<!--标题-->
<div id="title-box">
    <h1>Log in to BookCat</h1>
</div>
<br><br>
<!--登录的交互表单放在这个盒子里-->
<div class="container">
    <!--登录表单-->
    <s:form class="form-signin" data-role="form" action="login" method="post" id="myform" theme="simple">
        <br>
        <h3>立即登录</h3>
        <br>
        <!--账户名输入-->
        <div class="form-group">
            <s:textfield name="name" class="form-control" placeholder="BookCat账户名"/>
            <div id="fv_name">
                <s:fielderror fieldName="name"/>
            </div>
        </div>
        <br>
        <!--密码输入-->
        <div class="form-group">
            <s:password name="password" class="form-control" placeholder="密码"/>
            <div id="fv_password">
                <s:fielderror fieldName="password"/>
            </div>
        </div>
        <br>
        <!--记住登录-->
        <div class="form-check">
            <label class="form-check-label">
                <input type="checkbox" checked>
                记住我，下次自动登录
            </label>
        </div>
        <!--模拟登录按钮-->
        <a href="#" onclick="tosubmit()" class="button button-3d button-royal"><i class="fa fa-magic"></i> &nbsp;登录BookCat</a>
        <!--去往注册-->
        <a href="../join/register.jsp" class="button button-3d button-caution"><i class="fa fa-book"></i>
            &nbsp;没有账号？注册</a>
    </s:form>
    <hr>
    <!--手机号码登录-->
    <button class="button button-highlight button-box button-giant button-longshadow-right"><i class="fa fa-mobile"></i></button>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <!--微信登录-->
    <button class="button button-action button-box button-giant button-longshadow-right"><i class="fa fa-weixin"></i></button>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <!--腾讯QQ登录-->
    <button class="button button-primary button-box button-giant button-longshadow-right"><i class="fa fa-qq"></i></button>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <!--新浪微博登录-->
    <button class="button button-caution button-box button-raised button-giant button-longshadow-right"><i class="fa fa-weibo"></i></button>
    <br>
    <!--登录失败要弹出的模态框-->
    <div class="modal fade" id="modal" style="top: 150px">
        <div class="modal-dialog">
            <div class="modal-content">
                <!-- 模态框头部 -->
                <div class="modal-header">
                    <h4 class="modal-title">登录失败</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <!-- 模态框主体 -->
                <div class="modal-body">
                    请努力回忆用户名或密码。
                    <br>
                    如果您还没有注册，请点击<a href="../join/register.jsp">此处</a>注册BookCat。
                    <br>
                    您也可以在下面选择先逛逛，不登录。
                </div>
                <!-- 模态框底部 -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal">努力回忆</button>
                    <a class="btn btn-secondary" href="../main/main.jsp">随便逛逛</a>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        //登录失败提示
        var status='<%=request.getParameter("status")%>';
        if('failed'===status){
            $('#modal').modal();
        }
        //iCheck样式变化
        $('input').iCheck({
            checkboxClass: 'icheckbox_polaris',
            radioClass: 'iradio_polaris',
            increaseArea: '-10' // optional
        });
    });
</script>
</body>
</html>