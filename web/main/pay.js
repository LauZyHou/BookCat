window.onload=function () {
    // 该页面加载后处于顶端
    $(document).scrollTop(0);
};

// 全选
function chckall() {
    $('.chckbx').iCheck('check');
}

// 反选 TODO
function chckrsrv() {
}

// [管理收货信息]
function getModal1(){
    $('#modal1').modal();
}

// [选择优惠券]
function getModal2(){
    $('#modal2').modal();
}