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
    <meta name="keywords" content="BookCat,注册,购书,买书,书籍,阅读,文字,读书">
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
    <link href='http://cdn.webfont.youziku.com/webfonts/nomal/117834/45817/5af08133f629d8100cf43a20.css'
          rel='stylesheet' type='text/css'>
    <!--FontAwesome图标库-->
    <link rel="stylesheet" href="../WEB-RELY/font-awesome-4.7.0/css/font-awesome.min.css">
    <!--自定-->
    <link rel="stylesheet" href="../join/register.css">
    <script type="text/javascript" src="../join/register.js"></script>
    <!--标题-->
    <title>注册BookCat</title>
</head>
<!---------------------------------------------------------------------------------------->
<body>
<br><br><br>
<!--英文标题下面是中文小标题-->
<div id="title-box">
    <h1>Sign up for BookCat</h1>
    <h4>让文字点亮你的生活</h4>
</div>
<!--注册的交互表单放在这个盒子里-->
<div class="container">
    <!--注册表单-->
    <s:form class="form-signin" data-role="form" action="register" id="myform" method="post" theme="simple">
        <br><br><br>
        <!--账户名(昵称)-->
        <div class="form-group">
            <s:textfield name="name" class="form-control" placeholder="昵称"/>
            <div id="fv_name">
                <s:fielderror fieldName="name"/>
            </div>
        </div>
        <!--手机注册-->
        <button class="button button-raised button-primary button-pill"><i class="fa fa-mobile"></i>&nbsp; 手机号码注册
        </button>
        <br>
        <!--密码-->
        <div class="form-group">
            <s:password name="password" class="form-control" placeholder="密码"/>
            <div id="fv_password">
                <s:fielderror fieldName="password"/>
            </div>
        </div>
        <!--QQ注册-->
        <button class="button button-raised button-primary button-pill"><i class="fa fa-qq"></i>&nbsp;腾 讯QQ注册</button>
        <br>
        <!--再次输入密码-->
        <div class="form-group">
            <s:password name="password2" class="form-control" placeholder="请再次输入密码"/>
            <div id="fv_password2">
                <s:fielderror fieldName="password2"/>
            </div>
        </div>
        <!--微博注册-->
        <button class="button button-raised button-primary button-pill"><i class="fa fa-weibo"></i>&nbsp;新浪微博注册</button>
        <br><br>
        <!--两次密码不一致时的信息框-->
        <div class="alert alert-danger alert-dismissable fade show" id="unsame">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <strong>两次密码不一致!</strong>
        </div>
        <!--复选框+阅读并遵守用户协议-->
        <div class="form-check">
            <label class="form-check-label">
                <input type="checkbox" checked>
                我已经阅读
                <a href="#" id="usrPrtcl">
                    用户协议
                </a>
                ,并遵守约定。
            </label>
        </div>
        <br>
        <!--按钮:确认提交注册-->
        <a href="#" onclick="tosubmit()" class="button button-3d button-caution"><i class="fa fa-book"></i> &nbsp;加入BookCat</a>
        <!--按钮:切换至登录-->
        <a href="../join/login.jsp" class="button button-3d button-royal"><i class="fa fa-magic"></i> &nbsp;已有账号？登录</a>
    </s:form>
    <!--用户协议要弹出的模态框-->
    <div class="modal fade" id="modal">
        <div class="modal-dialog">
            <div class="modal-content">
                <!-- 模态框头部 -->
                <div class="modal-header">
                    <h4 class="modal-title">用户协议</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <!-- 模态框主体 -->
                <div class="modal-body">
                    <pre style="text-align: left">
[1]瑟晞姐姐说啥都对
[2]所有用户不得在本站任何页面发布含有下列内容的信息：
    (1)违反宪法确定的基本原则的
    (2)危害国家安全，泄漏国家机密，颠覆国家政权，破坏国家统一的
    (3)损害国家荣誉和利益的
    (4)煽动民族仇恨、民族歧视，破坏民族团结的
    (5)破坏国家宗教政策，宣扬邪教和封建迷信的
    (6)散布谣言，扰乱社会秩序，破坏社会稳定的
    (7)散布淫秽、色情、赌博、暴力、恐怖或者教唆犯罪的
    (8)侮辱或者诽谤他人，侵害他人合法权益的
    (9)煽动非法集会、结社、游行、示威、聚众扰乱社会秩序的
    (10)以非法民间组织名义活动的
                    </pre>
                </div>
                <!-- 模态框底部 -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal">我知道了</button>
                    <a class="btn btn-secondary" href="../other/failed.jsp">我拒绝</a>
                </div>
            </div>
        </div>
    </div>
    <!--注册失败要弹出的模态框-->
    <div class="modal fade" id="modal2">
        <div class="modal-dialog">
            <div class="modal-content">
                <!-- 模态框头部 -->
                <div class="modal-header">
                    <h4 class="modal-title">用户已被注册</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <!-- 模态框主体 -->
                <div class="modal-body">
                    您尝试注册的用户名已经被注册。
                    <br>
                    如是您已有账号，请转至登录页面，使用该账号进行登录。
                    <br>
                    否则，请更换其它用户名，重新进行注册。
                </div>
                <!-- 模态框底部 -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal">重新注册</button>
                    <a class="btn btn-secondary" href="../join/login.jsp">登录</a>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
$(document).ready(function () {
    //状态判断
    var status='<%=request.getParameter("status")%>';
    //登录失败提示
    if('failed'===status){
        $('#modal2').modal();
    }
    //两次密码不一致提示
    else if('unsame'===status){
        document.getElementById('unsame').style.display="block";
    }
});
</script>
</body>
</html>