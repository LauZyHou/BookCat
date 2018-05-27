window.onload=function () {
    // 该页面加载后处于顶端
    $(document).scrollTop(0);

    // AJAX回调函数
    var xmlhttp;
    function loadXMLDoc(url,cfunc)
    {
        if (window.XMLHttpRequest)
        {
            // IE7+,Firefox,Chrome,Opera,Safari
            xmlhttp=new XMLHttpRequest();
        }
        else
        {
            // IE6,IE5
            xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.onreadystatechange=cfunc;
        xmlhttp.open("GET",url,true);
        xmlhttp.send();
    }

    // 步骤1:信息无误
    function msgOk()
    {
        console.log("msgOK called");
        document.getElementsByClassName("step1").style.color.backgroundColor="#b9e563";
        loadXMLDoc("/try/ajax/ajax_info.txt",function()
        {
            if (xmlhttp.readyState==4 && xmlhttp.status==200)
            {
                document.getElementById("myDiv").innerHTML=xmlhttp.responseText;
                //获取要变颜色的h4标签列表
                document.getElementsByClassName("step1").style.color.backgroundColor="#b9e563";
            }
        });
    }
};


// [1]收货信息确认
function msgOk()
{
    console.log("msgOK called");
    var h_lst=document.getElementsByClassName("step1");
    for(var i=0;i<h_lst.length;i++){
        h_lst[i].style.backgroundColor="#b9e563";
        h_lst[i].style.color="#000000";
    }
    // 按钮不可用
    document.getElementById("btn1").disabled=true;
    document.getElementById("btn1").innerText="-已确认-";
    // 超链接移除
    var a1=document.getElementById("a1");
    a1.parentNode.removeChild(a1);
    document.getElementById("ttl1").innerText="1.确认收货信息(已确认)";
    // 屏幕缓动
    var h=$('header').height();
    $('html,body').animate({scrollTop: h}, 800);
    // 优惠券确认按钮可用
    $('#btn2').attr('disabled',false);
}


// [2]优惠券确认
function saleOk() {
    document.getElementById("stp2_1").style.backgroundColor="#b9e563";
    document.getElementById("stp2_1").style.color="#000000";
    // 按钮不可用
    document.getElementById("btn2").disabled=true;
    document.getElementById("btn2").innerText="-已选择-";
    // 超链接移除
    var a2=document.getElementById("a2");
    a2.parentNode.removeChild(a2);
    document.getElementById("ttl2").innerText="2.选择优惠券(已选择)";
    // 屏幕缓动
    var h=$('header').height()+$('#addressbox').height();
    $('html,body').animate({scrollTop: h}, 800);
    // 购物车确认可用
    $('#btn3').attr('disabled',false);
}

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