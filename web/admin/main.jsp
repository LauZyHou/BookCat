<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*"%>
<%@ page import="org.model.Book" %>
<%@ page import="org.model.User" %>
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
    <!--FontAwesome图标库-->
    <link rel="stylesheet" href="../WEB-RELY/font-awesome-4.7.0/css/font-awesome.min.css">
    <!--自定-->
    <link rel="stylesheet" href="../admin/main.css">
    <script src="../admin/main.js"></script>
    <title>管理员界面</title>
</head>
<body>
<header id="header">
    <h1 class="active">新书入库</h1>
    <h1>信息删改</h1>
    <h1>数据统计</h1>
    <h1>删库跑路</h1>
</header>
<article id="article">
    <!--[1]新书入库-->
    <div class="tabdiv" style="display: block">
        <s:form action="addbook" method="post" enctype="multipart/form-data">
            <div class="leftdiv">
                <h2>刚刚入库的书籍</h2>
<%
        String id=request.getParameter("id");
        System.out.println("在/admin/main.jsp中request的id="+id);
%>
                <div class="picbox"><img src="/pic/Exhibition/<%=id%>.jpg">
                </div>
                <s:file name="upload" label="上传的文件"/>
            </div>
            <div class="rightdiv">
                <div>
                    <div class="lft">
                        <h2>图书名:</h2>
                        <s:textfield name="name" class="form-control"/>
                    </div>
                    <div class="rgt">
                        <h2>分类:</h2>
                        <select  name="category">
                        <option value=0 selected="selected">请选择</option>
                        <option value=1>计算机</option>
                        <option value=2>物理学</option>
                        </select>
                    </div>
                </div>
                <div>
                    <div class="lft">
                        <h2>库存数目:</h2>
                        <s:textfield name="num" class="form-control" onkeyup="check(this);"/>
                    </div>
                    <div class="rgt">
                        <h2>定价:</h2>
                        <s:textfield name="price" class="form-control" onkeyup="check(this);"/>
                    </div>
                </div>
                <h2>图书简介:</h2>
                <s:textarea name="msg"/>
            </div>
            <s:submit class="btn btn-primary" onclick="flushPage()" id="sub1" value="入库"/>
        </s:form>
    </div>
    <!--[2]信息更改-->
    <div class="tabdiv">
        <%--用户--%>
        <div class="userdiv">
            <s:form name="form1">
                <table class="table table-hover table-primary">
                    <tr>
                        <th>字段</th>
                        <th>字段的值</th>
                        <th>允许的操作</th>
                    </tr>
                    <tr>
                        <td>用户id</td>
                        <td><s:textfield class="form-control" value="%{#session.usr.userId}" onkeyup="check(this);" id="userId"/></td>
                        <td><a class="btn btn-success"  onclick="findUsr()">查询</a></td>
                    </tr>
                    <tr>
                        <td>用户名</td>
                        <td><h4 id="username"></h4></td>
                        <td><a class="btn btn-danger" onclick="delUsr()">移除</a></td>
                    </tr>
                    <tr>
                        <td>密码</td>
                        <td>为保护用户隐私和权益，密码不可见也不可被定向修改</td>
                        <td><a class="btn btn-warning" onclick="updPs()" >重置</a></td>
                    </tr>
                    <tr>
                        <td>低级卡券</td>
                        <td><s:textfield class="form-control" id="sale1" value="%{#session.usr.sale1}" onkeyup="check(this);"/></td>
                        <td><a class="btn btn-primary" onclick="UpdS1()">修改</a></td>
                    </tr>
                    <tr>
                        <td>中级卡券</td>
                        <td><s:textfield class="form-control" id="sale2" value="%{#session.usr.sale2}" onkeyup="check(this);"/></td>
                        <td><a class="btn btn-primary" onclick="UpdS2()">修改</a></td>
                    </tr>
                    <tr>
                        <td>高级卡券</td>
                        <td><s:textfield class="form-control" id="sale3" value="%{#session.usr.sale3}" onkeyup="check(this);"/></td>
                        <td><a class="btn btn-primary" onclick="UpdS3()">修改</a></td>
                    </tr>
                </table>
            </s:form>
        </div>
        <%--书--%>
        <div class="bookdiv">
            <s:form>
                <table class="table table-hover table-success">
                    <tr>
                        <th>字段</th>
                        <th>字段的值</th>
                        <th>允许的操作</th>
                    </tr>
                    <tr>
                        <td>图书id</td>
                        <td><s:textfield class="form-control" onkeyup="check(this);" id="bookId"/></td>
                        <td><a class="btn btn-success" onclick="findBk()">查询</a></td>
                    </tr>
                    <tr>
                        <td>图书名</td>
                        <td><h4 id="bookname"></h4></td>
                        <td><a class="btn btn-danger" onclick="delBk()">下架</a></td>
                    </tr>
                    <tr>
                        <td>库存数</td>
                        <td><s:textfield class="form-control" onkeyup="check(this);" id="booknum"/></td>
                        <td><a class="btn btn-primary" onclick="UpdNum()">更新</a></td>
                    </tr>
                    <tr>
                        <td>热度</td>
                        <td><s:textfield class="form-control" onkeyup="check(this);" id="hotnum"/></td>
                        <td><a class="btn btn-primary" onclick="UpdHotnum()">修改</a></td>
                    </tr>
                    <tr>
                        <td>定价</td>
                        <td><s:textfield class="form-control" onkeyup="check(this);" id="price"/></td>
                        <td><a class="btn btn-primary" onclick="UpdPri()">修改</a></td>
                    </tr>
                    <tr>
                        <td>图书分类</td>
                        <td>
                            <s:select class="ComboType" list="#{'1':'计算机','2':'物理学','3':'生命科学','24':'生活情感'}" id="category"/>
                        </td>
                        <td><a class="btn btn-primary" onclick="UpdCate()">修改</a></td>
                    </tr>
                </table>
            </s:form>
        </div>
    </div>
    <!--[3]数据统计-->
    <div class="tabdiv">
        <%--用户--%>
        <div class="userdiv">
            <table class="table table-hover table-primary">
                <tr>
                    <th>用户id</th>
                    <th>用户名</th>
                    <th>充值程度</th>
                </tr>
<%
                    List<User> userslist=(List<User>) session.getAttribute("userslist");
                    if(userslist!=null){
                        for(int i=0;i<8 && i<userslist.size();i++){
                            User ur=userslist.get(i);
                            int money=ur.getMoney();
%>
                <tr>
                    <td><%=ur.getId()%></td>
                    <td><%=ur.getName()%></td>
                    <td>
                        <div class="progress">
                            <div class="progress-bar progress-bar-striped progress-bar-animated bg-<%=money>1000?"success":money>400?"primary":money>30?"warning":"danger"%>" style="width:<%=money/60%>%"></div>
                        </div>
                    </td>
                </tr>
<%
                        }
                    }
%>
            </table>
        </div>
        <%--书--%>
        <div class="bookdiv">
            <table class="table table-hover table-success">
                <tr>
                    <th>图书id</th>
                    <th>图书名</th>
                    <th>热度</th>
                </tr>
<%
                    @SuppressWarnings("unchecked")
                    List<Book> bkhlist=(List<Book>)session.getAttribute("bkhlist");
                    if(bkhlist!=null){
                        for(int i=0;i<8 && i<bkhlist.size();i++){
                            Book b=bkhlist.get(i);
%>
                <tr>
                    <td><%=b.getId()%></td>
                    <td><%=b.getName()%></td>
                    <td>
                        <div class="progress">
                            <div class="progress-bar progress-bar-striped progress-bar-animated bg-<%=b.getHotnum()>80?"success":b.getHotnum()>50?"primary":b.getHotnum()>30?"warning":"danger"%>" style=" width:<%=b.getHotnum()%>%">
                            </div>
                        </div>
                    </td>
                </tr>
<%
                        }
                    }
%>
            </table>
        </div>
    </div>
    <!--[4]删库跑路-->
    <div class="tabdiv">
        <h3>rm -rf /</h3>
        <div class="map">
            <img src="../WEB-PIC/Admin/map.jpg">
        </div>
    </div>
</article>
<footer>
    管理员，欢迎您。
    <br>
    我的资料 · 联系老板 · 上班打卡 · 申请调休 · 公司内网 · 越级举报 ·
    <a href="../admin/login.jsp">我要辞职</a>
</footer>
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

    //有些栏目必须是数字
    function check(obj) {
        if (isNaN(obj.value)) {
            alert("这一项必须是数字！");
            obj.value = "";
        }
    }

    //+++
    //处理函数,用于绑定给状态触发器
    function adminUserProcessor() {
        var responseContext;
        //如果返回成功并取得了响应内容
        if (4 === xmlhttp.readyState && 200 === xmlhttp.status) {
            console.log('完毕');
            responseContext = xmlhttp.responseText;
            //更新购物车上的数字部分,返回的状态码即是sum
            if (responseContext == '-1') {
                window.alert('没有提交ID');
            }
            else if (responseContext == '-2') {
                window.alert('请先登录');
            }
            else {
                console.log(responseContext);
                var words = responseContext.split("\$");
                console.log(words);
                //如果取session,取到的总是页面加载时的
                $('#username').text(words[1]);
                document.getElementById('sale1').value=words[2];
                document.getElementById('sale2').value=words[3];
                document.getElementById('sale3').value=words[4];
            }
        }
    }

    //根据ID查找用户信息
    function findUsr() {
        var usrId=$("#userId").val();
        loadXMLDoc("/adFind.servlet?userid="+usrId,adminUserProcessor);
    }

    window.onload = function () {
        // 获取tab头的列表
        var tab_ttl = document.getElementById("header");
        //获取列表中的h1项数组
        var tab_lst = tab_ttl.getElementsByTagName("h1");
        //获取内容切换大盒子(就是中央区域)
        var tabBox = document.getElementById("article");
        //获取大盒子中的子盒子数组
        var tabdiv = tabBox.getElementsByClassName("tabdiv");
        //对于ta头列表的每一项
        for (var i = 0; i < tab_lst.length; i++) {
            // 为其添加下标
            tab_lst[i].index = i;
            //为其添加点击事件
            tab_lst[i].onclick = function () {
                // 先将所有的都隐藏
                for (var j = 0; j < tab_lst.length; j++) {
                    tab_lst[j].className = "";
                    tabdiv[j].style.display = "none";
                }
                //再将自己激活
                this.className = "active";
                tabdiv[this.index].style.display = "block";
            };
        }
    };
</script>
</body>
</html>

