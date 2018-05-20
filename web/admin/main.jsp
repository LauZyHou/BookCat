<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <!--BootStrap依赖-->
    <link rel="stylesheet" href="../WEB-RELY/bootstrap.min.css">
    <script src="../WEB-RELY/jquery.min.js"></script>
    <script src="../WEB-RELY/popper.min.js"></script>
    <script src="../WEB-RELY/bootstrap.min.js"></script>
    <!--自定-->
    <link rel="stylesheet" href="../admin/main.css">
    <title>管理员界面</title>
</head>
<body>
<header id="header">
    <h1 class="active">图书上架</h1>
    <h1>功能2待定</h1>
    <h1>功能3待定</h1>
    <h1>功能4待定</h1>
</header>
<article id="article">
    <div class="tabdiv" style="display: block">
        1
    </div>
    <div class="tabdiv">
        2
    </div>
    <div class="tabdiv">
        3
    </div>
    <div class="tabdiv">
        4
    </div>
</article>
<footer>

</footer>
<script>
    window.onload=function () {
        // 获取tab头的列表
        var tab_ttl=document.getElementById("header");
        //获取列表中的h1项数组
        var tab_lst=tab_ttl.getElementsByTagName("h1");
        //获取内容切换大盒子(就是中央区域)
        var tabBox=document.getElementById("article");
        //获取大盒子中的子盒子数组
        var tabdiv=tabBox.getElementsByClassName("tabdiv");
        //对于ta头列表的每一项
        for(var i=0;i<tab_lst.length;i++){
            // 为其添加下标
            tab_lst[i].index=i;
            //为其添加点击事件
            tab_lst[i].onclick=function () {
                // 先将所有的都隐藏
                for(var j=0;j<tab_lst.length;j++){
                    tab_lst[j].className="";
                    tabdiv[j].style.display="none";
                }
                //再将自己激活
                this.className="active";
                tabdiv[this.index].style.display="block";
            };
        }
    };
</script>
</body>
</html>

