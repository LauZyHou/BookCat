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
    <!--FontAwesome图标库-->
    <link rel="stylesheet" href="../WEB-RELY/font-awesome-4.7.0/css/font-awesome.min.css">
    <!--自定-->
    <link rel="stylesheet" href="../admin/main.css">
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
        <s:form>
        <div class="leftdiv">
            <h2>刚刚入库的书籍</h2>
            <div class="picbox">

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
                    <s:select list="#{'1':'计算机','2':'物理学'}"/>
                </div>
            </div>
            <div>
                <div class="lft">
                    <h2>库存数目:</h2>
                    <s:textfield name="num" class="form-control" onkeyup="check(this);"/>
                </div>
                <div class="rgt">
                    <h2>定价:</h2>
                    <s:textfield name="num" class="form-control" onkeyup="check(this);"/>
                </div>
            </div>
            <h2>图书简介:</h2>
            <s:textarea name="msg"/>
        </div>
        <s:submit class="btn btn-primary" id="sub1" value="入库"/>
        </s:form>
    </div>
    <!--[2]信息更改-->
    <div class="tabdiv">
        <%--用户--%>
        <div class="userdiv">
            <s:form>
                <table class="table table-hover table-primary">
                    <tr>
                        <th>字段</th>
                        <th>字段的值</th>
                        <th>允许的操作</th>
                    </tr>
                    <tr>
                        <td>用户id</td>
                        <td><s:textfield class="form-control" onkeyup="check(this);"/></td>
                        <td><a class="btn btn-success">查询</a></td>
                    </tr>
                    <tr>
                        <td>用户名</td>
                        <td><h4>刘知昊</h4></td>
                        <td><a class="btn btn-danger">移除</a></td>
                    </tr>
                    <tr>
                        <td>密码</td>
                        <td>为保护用户隐私和权益，密码不可见也不可被定向修改</td>
                        <td><a class="btn btn-warning">重置</a></td>
                    </tr>
                    <tr>
                        <td>低级卡券</td>
                        <td><s:textfield class="form-control" onkeyup="check(this);"/></td>
                        <td><a class="btn btn-primary">修改</a></td>
                    </tr>
                    <tr>
                        <td>中级卡券</td>
                        <td><s:textfield class="form-control" onkeyup="check(this);"/></td>
                        <td><a class="btn btn-primary">修改</a></td>
                    </tr>
                    <tr>
                        <td>高级卡券</td>
                        <td><s:textfield class="form-control" onkeyup="check(this);"/></td>
                        <td><a class="btn btn-primary">修改</a></td>
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
                        <td><s:textfield class="form-control" onkeyup="check(this);"/></td>
                        <td><a class="btn btn-success">查询</a></td>
                    </tr>
                    <tr>
                        <td>图书名</td>
                        <td><h4>MySQL从删库到跑路</h4></td>
                        <td><a class="btn btn-danger">下架</a></td>
                    </tr>
                    <tr>
                        <td>库存数</td>
                        <td><s:textfield class="form-control" onkeyup="check(this);"/></td>
                        <td><a class="btn btn-primary">更新</a></td>
                    </tr>
                    <tr>
                        <td>热度</td>
                        <td><s:textfield class="form-control" onkeyup="check(this);"/></td>
                        <td><a class="btn btn-primary">修改</a></td>
                    </tr>
                    <tr>
                        <td>定价</td>
                        <td><s:textfield class="form-control" onkeyup="check(this);"/></td>
                        <td><a class="btn btn-primary">修改</a></td>
                    </tr>
                    <tr>
                        <td>图书分类</td>
                        <td>
                            <s:select class="ComboType" list="#{'1':'WiFi','2':'移动网络','3':'无网络'}"/>
                        </td>
                        <td><a class="btn btn-primary">修改</a></td>
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
            int[] userid={4,1,6,9,8,7,-1,-2};
            String[] username={"吴瑟晞","刘知昊","马家俊","李喆雯","蔡坤","辛翌菲","虚拟猫咪1","虚拟猫咪2"};
            int[] userval={82,62,51,40,32,20,10,2};
            for(int i=0;i<userid.length;i++){
%>
                <tr>
                    <td><%=userid[i]%></td>
                    <td><%=username[i]%></td>
                    <td>
                        <div class="progress">
                            <div class="progress-bar progress-bar-striped progress-bar-animated bg-<%=userval[i]>80?"success":userval[i]>50?"primary":userval[i]>30?"warning":"danger"%>" style="width:<%=userval[i]%>%">
                            </div>
                        </div>
                    </td>
                </tr>
<%
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
            int[] bookid={1,8,2,9,8,7,-1,-2};
            String[] bookname={"Redis开发与运维","c++ primer","RabbitMQ实战指南","Kafka入门与实践","算法竞赛入门经典","道德情操论","MongoDB权威指南","Spring Boot实战"};
            int[] bookval={90,62,51,40,32,20,10,2};
            for(int i=0;i<bookid.length;i++){
%>
                <tr>
                    <td><%=bookid[i]%></td>
                    <td><%=bookname[i]%></td>
                    <td>
                        <div class="progress">
                            <div class="progress-bar progress-bar-striped progress-bar-animated bg-<%=bookval[i]>80?"success":bookval[i]>50?"primary":bookval[i]>30?"warning":"danger"%>" style="width:<%=bookval[i]%>%">
                            </div>
                        </div>
                    </td>
                </tr>
<%
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
    我的资料 · 联系老板 · 上班打卡 · 申请调休 · 公司内网 · 越级举报 · 我要辞职
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

    //有些栏目必须是数字
    function check(obj){
        if (isNaN(obj.value))
        {
            alert("这一项必须是数字！");
            obj.value="";
        }
    }
</script>
</body>
</html>

