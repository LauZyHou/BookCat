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
//     $('.chckbx').each(function () {
//         if($(this).parent().hasClass('checked')){
//             $(this).iCheck('check');
//         }else{
//             $(this).iCheck('uncheck');
//         }
// });

    // $('.chckbx').on('ifChecked',{
    //     $(this).iCheck('uncheck');
    // });
    // $('.chckbx').on('ifUnchecked', function(event){
    //     $(this).iCheck('check');
    // });
}

// [管理收货信息]
function getModal1(){
    $('#modal1').modal();
}

// [选择优惠券]
function getModal2(){
    $('#modal2').modal();
}