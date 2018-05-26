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
    <script src="../detail/book.js"></script>
    <title>书籍页面</title>
</head>
<!---------------------------------------------------------------------------------------->
<body>
<!--导航栏-->
<s:include value="../sharing/navbar.jsp"/>
<header>
    <div id="ttlbox">
        <s:property value="#request.nowbook.name"/>
    </div>
    <div>
        <div id="picbox">
            <img src="../WEB-PIC/Exhibition/<s:property value="#request.nowbook.id"/>.jpg"/>
        </div>
        <a href="javascript:void(0);" class="btn btn-primary" onclick="addToCar()"><p>立<br>即<br>添<br>加</p></a>
        <a href="https://read.douban.com" class="btn btn-success" target="_blank"><p>在<br>线<br>试<br>读</p></a>
        <div id="wordbox">
            <s:property value="#request.nowbook.msg"/>
        </div>
    </div>
</header>
<article>
    <!--回形针-->
    <img src="../WEB-PIC/Icon/clip.svg" id="clip"/>
    <!--目录-->
    <div id="catalog">
        <s:include value="../temporary/catalog.jsp"/>
    </div>
    <!--已经存在的留言-->
    <div class="exist exist-A">
        <div class="namebox">
            刘知昊
        </div>
        <div class="usrpicbox">
            <img src="../WEB-PIC/User/1.jpg"/>
        </div>
        <div class="lybox">
            <span>“</span>这本书很好看的喵<span>”</span>
        </div>
    </div>
    <div class="exist exist-B">
        <div class="namebox">
            蔡坤
        </div>
        <div class="usrpicbox">
            <img src="../WEB-PIC/User/8.jpg"/>
        </div>
        <div class="lybox">
            <span>“</span>喵喵喵喵喵喵喵喵喵喵喵喵喵喵喵喵喵喵喵喵喵喵喵喵喵喵喵喵喵喵喵喵喵<span>”</span>
        </div>
    </div>
    <!--留言相关-->
    <div id="leave">
        <!--提交留言表单-->
        <s:form>
            <s:textarea placeholder="在这里添加您的评论..."/>
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
<%--js部分--%>
<script>
// AJAX回调函数
var xmlhttp;
function loadXMLDoc(url,cfunc)
{
    console.log("load开始");
    if (window.XMLHttpRequest)
    {
        // IE7+,Firefox,Chrome,Opera,Safari
        xmlhttp=new XMLHttpRequest();
    }
    else
    {
        // IE6,IE5
        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    }
    // 将状态触发器绑定到指定的处理函数
    xmlhttp.onreadystatechange=cfunc;
    xmlhttp.open("GET",url,true);
    xmlhttp.send();
    console.log("load结束");
}


//添加到购物车按下时
function addToCar() {
    console.log('按下');
    //用EL表达式向ajax后端传值
    loadXMLDoc("/addToCar.servlet?bookid=${requestScope.nowbook.id}",addCarProcessor);
    console.log("结束");
}

//添加到购物车的处理函数,用于绑定给状态触发器
function addCarProcessor(){
    var responseContext;
    //如果返回成功并取得了响应内容
    if(4===xmlhttp.readyState && 200===xmlhttp.status){
        console.log('完毕');
        responseContext=xmlhttp.responseText;
        if(responseContext=='-2'){
            window.alert('没有提交书籍号');
        }else if(responseContext=='-1'){
            window.alert('请先登录');
        }
        else if(responseContext=='1'){
            window.alert('添加成功');
            //更新数字部分 TODO
            $('#circle').text(${sessionScope.sum});
        }else {
            window.alert('未知的返回码');
        }
    }
}
</script>
</body>
</html>
