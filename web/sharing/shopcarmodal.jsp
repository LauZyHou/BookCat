<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!--[查看购物车]要弹出的模态框-->
<div class="modal fade" id="shpCrMdl">
    <div class="modal-dialog">
        <div class="modal-content">
            <!--模态框头部-->
            <div class="modal-header">
                <h4 class="modal-title"><s:property value="#session.usr.name"/>[购物车]</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <!-- 模态框主体 -->
            <div class="modal-body" id="body_shpCrMdl" style="width:100%;text-align: center;">
                <%--这里的内容将被服务器返回的html传入--%>
            </div>
            <!-- 模态框底部 -->
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="location.reload(true)">确认</button>
                <%--<button class="btn btn-secondary" data-dismiss="modal">取消</button>--%>
            </div>
        </div>
    </div>
</div>

<!--模态框上发生操作的ajax-->
<script>
//按下某个操作
function clkDeal(deal,id) {
    //用EL表达式向ajax后端传值
    loadXMLDoc("/dealCar.servlet?deal="+deal+"&id="+id,dealCarProcessor);
}

//当<操作购物车>状态改变时
function dealCarProcessor() {
    var responseContext;
    console.log(xmlhttp.readyState,xmlhttp.status);
    //如果返回成功并取得了响应内容
    if(4===xmlhttp.readyState && 200===xmlhttp.status){
        responseContext=xmlhttp.responseText;
        if("-1"==responseContext){
            window.alert("已经掉线啦,请重新登录");
        }else if("-2"==responseContext){
            window.alert("啊哦,购物车不见了,请重新建立购物车~");
        }else if("-3"==responseContext){
            window.alert("啊哦,购物车是空的,请刷新页面后重新添加~");
        }else if("-4"==responseContext){
            window.alert("[!]deal或id未能获得");
        }else if("-5"==responseContext){
            window.alert("[!]购物车中不存在的书籍号(id)");
        }else if("-6"==responseContext){
            window.alert("[!]不存在的操作方式(deal的值)");
        }else{
            //获取2个值的数组,分别是操作的书的id和操作后的值
            var arry_idAndNum=responseContext.split(" ");
            //判定操作后的值
            //如果第二个字段为-1表示要移除
            if("-1"==arry_idAndNum[1]){
                var tr_id="tr_"+arry_idAndNum[0];
                console.log(tr_id);
                var rmv=document.getElementById(tr_id);
                rmv.parentNode.removeChild(rmv);
            }
            //增加或减少
            else{
                var td_num_id="td_num_"+arry_idAndNum[0];
                document.getElementById(td_num_id).innerText=arry_idAndNum[1];
            }
        }
    }
    
}
</script>
