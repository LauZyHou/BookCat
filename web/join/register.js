// iCheck样式变化
$(document).ready(function () {
    $('input').iCheck({
        checkboxClass: 'icheckbox_polaris',
        radioClass: 'iradio_polaris',
        increaseArea: '-10' // optional
    });
});

//点击要看协议时
function dsplyPrtcl(){
    window.alert("瑟希姐姐说啥都对");
}

//a标签模拟表单行为
function tosubmit(){
    var myform=document.getElementById("myform");
    myform.submit();
    return false;
}