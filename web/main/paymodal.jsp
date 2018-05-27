<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!--[修改收货信息]要弹出的模态框-->
<div class="modal fade" id="modal1">
    <div class="modal-dialog">
        <div class="modal-content">
            <!--模态框头部-->
            <div class="modal-header">
                <h4 class="modal-title">修改收货信息</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <!-- 模态框主体 -->
            <div class="modal-body">
                <s:include value="../temporary/address.jsp"/>
            </div>
            <!-- 模态框底部 -->
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="clkOkMsg()">确认</button>
                <button class="btn btn-secondary" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>
<!--[选择优惠券]要弹出的模态框-->
<div class="modal fade" id="modal2">
    <div class="modal-dialog">
        <div class="modal-content">
            <!--模态框头部-->
            <div class="modal-header">
                <h4 class="modal-title">选择优惠券</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <!-- 模态框主体 -->
            <div class="modal-body" style="text-align: center">
                <s:radio id="card" list="#{'1':'风吹草动卡','2':'排山倒海卡','3':'宇宙星河卡'}" name="gender" value="1"/>
            </div>
            <!-- 模态框底部 -->
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="clkOkSale()">确认</button>
                <button class="btn btn-secondary" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>
<script>
    //确认收货信息
    function clkOkMsg() {
        //将上面提交的两个地址组合放入总地址
        $('#stp1_1').text($('#city').val().split("-").join(" ")+" "+$('#detail').val());
        //电话号码
        $('#stp1_2').text($('#tel').val());
    }
    //确认优惠券
    function clkOkSale() {
        //设定卡
        var str;//提示给用户的字符串
        switch ($('input:radio:checked').val()){
            case '1':
                str="一张简单有效的[风吹草动卡]";
                break;
            case '2':
                str="一张狂暴无比的[排山倒海卡]";
                break;
            case '3':
                str="一张惊世骇俗的[宇宙星河卡]";
                break;
            default:
                str="一张神秘莫测的[没有这张卡]";
        }
        //写入电话号码
        $('#stp2_1').text(str);
    }
</script>