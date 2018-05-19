<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
    <!--文档字符编码为utf-8-->
    <meta charset="utf-8">
    <!--自定义渲染方式:当使用IE为内核的浏览器,会渲染至它支持的最高版本;当启用Chrome Frame,会被Chrome内核渲染-->
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <!--设定网页的布局:宽度为设备宽度,页面的初始缩放值为1-->
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <!--网页的关键字,目前似乎对SEO没有什么用了-->
    <meta name="keywords" content="BookCat,登录,购书,买书,书籍,阅读,文字,读书">
    <!--网页的描述-->
    <meta name="description" content="BookCat购书系统是在J2EE课程的带领下完成的">
    <!--Buttons CSS按钮样式库-->
    <link href="../WEB-RELY/button.css" rel="stylesheet" type="text/css">
    <!--BootStrap依赖-->
    <link rel="stylesheet" href="../WEB-RELY/bootstrap.min.css">
    <script src="../WEB-RELY/jquery.min.js"></script>
    <script src="../WEB-RELY/popper.min.js"></script>
    <script src="../WEB-RELY/bootstrap.min.js"></script>
    <!--iCheck CSS复选框单选按钮库-->
    <link href="../WEB-RELY/polaris.css" rel="stylesheet">
    <script src="../WEB-RELY/icheck.min.js"></script>
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