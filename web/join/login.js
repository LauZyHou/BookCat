// iCheck样式变化
$(document).ready(function () {
    $('input').iCheck({
        checkboxClass: 'icheckbox_polaris',
        radioClass: 'iradio_polaris',
        increaseArea: '-10' // optional
    });
});

//a标签模拟表单行为
function tosubmit(){
    var myform=document.getElementById("myform");
    myform.submit();
    return false;
}

//登录失败提示
$(document).ready(function () {
    var status='<%=request.getParameter("status")%>';
    if('failed'===status){
        $('#modal').modal();
    }
});