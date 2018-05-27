<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.opensymphony.xwork2.ActionContext" %>
<%@ page import="org.model.Orders" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="org.model.BkOdr" %>
<%@ page import="java.util.*" %>
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
    <!--自定-->
    <link rel="stylesheet" href="../other/history.css">
    <script src="../other/history.js"></script>
    <title>购买记录</title>
</head>
<!---------------------------------------------------------------------------------------->
<body>
<!--导航栏-->
<s:include value="../sharing/navbar.jsp"/>
<header>
    <h1>购买记录</h1>
</header>
<article>
<s:form>
    <table class="table table-hover table-primary">
        <tr>
            <th>订单号</th>
            <th>总价</th>
            <th>下单时间</th>
            <th>明细</th>
        </tr>
<%
    //取session中的订单
    Map sssn=ActionContext.getContext().getSession();
    List<Orders> orders=new ArrayList<Orders>();
    orders=(List<Orders>)sssn.get("hisorders");
    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    if (orders!=null){
        for(int i=0;i<orders.size();i++){
            String str = new DecimalFormat("000").format(i+1);
            Orders order=orders.get(i);
%>
        <tr>
            <td><%=str%></td>
            <td><%=order.getSum()%></td>
            <td><%=df.format(order.getTime()).toString()%></td>
            <td>
                <%--按钮触发模态框--%>
                <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#<%=order.getId()%>" >
                明细
                </button>
            </td>
        </tr>
            <%--明细模态框：书本名及个数--%>
        <div class="modal fade" id="<%=order.getId()%>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabel" >猫书商城购书清单</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>

                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-6">
                                书名
                            </div>
                            <div class="col-md-3">
                                数量
                            </div>
                            <div class="col-md-3">
                                单价
                            </div>
                        </div>
                        <%--使用模态框栅格格式对书名、数量、单价进行显示--%>
                        <%
                            Iterator<BkOdr> bkOdrIterator=order.getBkOdrsById().iterator();
                            String detail=new String("");
                            while(bkOdrIterator.hasNext()) {
                                BkOdr bkOdr=new BkOdr();
                                String detailname = new String("");
                                String detailnum = new String("");
                                String detailprice = new String("");
                                bkOdr=bkOdrIterator.next();
                                detailname = bkOdr.getBookByBookid().getName();
                                detailnum =  String.valueOf(bkOdr.getNum());
                                detailprice = String.valueOf(bkOdr.getBookByBookid().getPrice());
                        %>
                        <div class="row">
                            <div class="col-md-6">
                                <%=detailname%>
                            </div>
                            <div class="col-md-3">
                                <%=detailnum%>
                            </div>
                            <div class="col-md-3">
                                <%=detailprice%>￥
                            </div>
                        </div>
                        <%
                            }
                        %>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">ok</button>
                    </div>
                </div>
            </div>
        </div>
<%
        }
    }
%>
    </table>
</s:form>
</article>

<!--页脚-->
<footer>
    BookCat-让文字点亮你的生活！<br>
    关于我们 · 联系我们 · 加入我们 · 服务声明 · 友情链接 · 网站地图 · 移动应用
</footer>
</body>
</html>
