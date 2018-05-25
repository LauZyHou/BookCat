window.onload=function () {
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


// 收货信息确认
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
}


// 优惠券确认
function saleOk() {
    document.getElementById("step2").style.backgroundColor="#b9e563";
    document.getElementById("step2").style.color="#000000";
    // 按钮不可用
    document.getElementById("btn2").disabled=true;
    document.getElementById("btn2").innerText="-已选择-";
    // 超链接移除
    var a2=document.getElementById("a2");
    a2.parentNode.removeChild(a2);
    document.getElementById("ttl2").innerText="2.选择优惠券(已选择)";
}

// 全选
function chkall() {
    //TODO
}