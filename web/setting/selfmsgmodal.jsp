<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!--[修改头像]要弹出的模态框-->
<div class="modal fade" id="updatehead">
    <div class="modal-dialog">
        <div class="modal-content">
            <!--模态框头部-->
            <div class="modal-header">
                <h4 class="modal-title">修改您的头像</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <!-- 模态框主体 -->
            <div class="modal-body">
                <s:form id="updtHeadForm" action="" method="post" enctype="multipart/form-data">
                    <s:file name="upload" label="上传的头像"/>
                </s:form>
            </div>
            <!-- 模态框底部 -->
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="submitHdFm()">上传</button>
                <button class="btn btn-secondary" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>

<script>
    //a标签模拟表单行为
    function submitHdFm(){
        $('#updtHeadForm').submit();
        return false;
    }
</script>