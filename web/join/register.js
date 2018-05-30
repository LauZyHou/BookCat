//页面加载好之后
$(document).ready(function () {
    // iCheck样式变化
    $('input').iCheck({
        checkboxClass: 'icheckbox_polaris',
        radioClass: 'iradio_polaris',
        increaseArea: '-10' // optional
    });

    //用户协议的显示样式
    $('[data-toggle="tooltip"]').tooltip();
    //点击查看用户协议
    $('#usrPrtcl').click(function () {
        $('#modal').modal();
    });
});

//a标签模拟表单行为
function tosubmit(){
    var myform=document.getElementById("myform");
    myform.submit();
    return false;
}
