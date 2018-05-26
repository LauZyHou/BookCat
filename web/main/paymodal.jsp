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
                <button type="button" class="btn btn-primary" data-dismiss="modal">确认</button>
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
                <s:radio list="#{'1':'风吹草动卡','2':'排山倒海卡','3':'宇宙星河卡'}" name="gender" value="1"/>
            </div>
            <!-- 模态框底部 -->
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">确认</button>
                <button class="btn btn-secondary" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>
