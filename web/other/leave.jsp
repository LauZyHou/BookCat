<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.opensymphony.xwork2.ActionContext" %>
<%@ page import="org.model.Leave" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.DecimalFormat" %>
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
    <script src="../main/pay.js"></script>
    <title>我的留言</title>
</head>
<!---------------------------------------------------------------------------------------->
<body>
<!--导航栏-->
<s:include value="../sharing/navbar.jsp"/>
<header>
    <h1>我的留言</h1>
</header>
<article>
    <s:form>

        <table class="table table-hover table-primary">
            <tr>
                <th>留言编号</th>
                <th>留言内容(开头)</th>
                <th>留言时间</th>
                <th>明细</th>
            </tr>

            <%
                //取session中的留言
                Map sssn=ActionContext.getContext().getSession();
                List<Leave> leaves=new ArrayList<Leave>();
                leaves=(List<Leave>)sssn.get("uleaves");
                SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                if (leaves!=null){
                    for(int i=0;i<leaves.size();i++){
                        String str = new DecimalFormat("000").format(i+1);
                        Leave le=leaves.get(i);

            %>
            <tr>
                <td><%=str%></td>
                <%
                    String strs=le.getComments();
                    int sum = 0;
                    String finalStr = "";
                    if (null == strs || strs.getBytes().length <= 15) {
                        finalStr = (strs==null?"":strs);
                    } else {
                        for (int j = 0; j < strs.length(); j++) {
                            String str1 = strs.substring(j, j + 1);
                            // 累加单个字符字节数
                            sum += str1.getBytes().length;
                            if (sum > 15) {
                                finalStr = strs.substring(0, j) + "...";
                                break;
                            }
                        }
                    }

                %>
                <td><%=finalStr%></td>
                <td><%=df.format(le.getLvpk().getTime()).toString()%></td>
                <td>
                        <%--按钮触发模态框--%>
                    <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#<%=i%>" >
                        明细
                    </button>
                </td>
            </tr>

                <%--明细模态框：留言内容--%>
            <div class="modal fade" id="<%=i%>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="myModalLabel">留言明细</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                &times;
                            </button>

                        </div>
                        <div class="modal-body">

                                    <%=le.getComments()%>

                            <%System.out.println(i);%>

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
