window.onload=function () {
    // 该页面加载后处于顶端
    $(document).scrollTop(0);
};

// [3]购物车中的商品确认
function bookOk(){
    // 设置不可选
    $('.chckbx').iCheck('disable');
    // $('.flybtn').addClass('disabled');
    // 设置从购物车删除不可用
    $('.flybtn').attr('disabled',true);
    // 移除全选和反选
    $('#chckall,#chckrsrv').remove();
    // 按钮不可用+按钮上文字提示改变
    $('#btn3').attr('disabled',true).text('-已完成-');
    // 该盒子文字提示改变
    $('#bookbox').children('div').children('h4').text('3.从购物车中选择商品(已完成)');
    // 让生成订单的div显示
    $('#orderbox').css('display','block');
    // 屏幕滑到底
    var h = $(document).height()-$(window).height();
    // $(document).scrollTop(h);
    // 缓缓滑动
    $('html,body').animate({scrollTop: h}, 800);
}


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