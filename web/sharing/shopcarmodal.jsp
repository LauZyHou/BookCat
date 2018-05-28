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
                
            </div>
            <!-- 模态框底部 -->
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">确认</button>
                <button class="btn btn-secondary" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>
