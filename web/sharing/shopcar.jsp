<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!--购物车-->
<img src="../WEB-PIC/Icon/shopcar.svg" id="shopcar">
<!--购物车上的小圆点-->
<button class="button button-raised button-action button-circle button-caution" id="circle" onclick="showmd()">
${sessionScope.sum}
</button>
<!--购物车要弹出的模态框-->
<s:include value="../sharing/shopcarmodal.jsp"/>
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

    //按下
    function showmd() {
        $('#body_shpCrMdl').text('啊啊啊');
        //用EL表达式向ajax后端传值
        loadXMLDoc("/getCar.servlet",gottenCarProcessor);
        console.log("结束");
    }
    
    //处理获取购物车状态改变
    function gottenCarProcessor() {
        var responseContext;
        console.log(xmlhttp.readyState,xmlhttp.status);
        //如果返回成功并取得了响应内容
        if(4===xmlhttp.readyState && 200===xmlhttp.status){
            responseContext=xmlhttp.responseText;
            $('#body_shpCrMdl').html(responseContext);
            $('#shpCrMdl').modal();
        }
    }
</script>
