//---

//根据ID删除用户
function delUsr() {
    var usrId=$("#userId").val();
    loadXMLDoc("/adDel.servlet?userId="+usrId,adminDelProcessor);
    window.alert("删除成功!")
}
//重置用户密码为123456
function updPs() {
    var usrId=$("#userId").val();
    loadXMLDoc("/updP.servlet?userId="+usrId,adminDelProcessor);
    console.log("结束");
}
// 修改sale1数量
function UpdS1() {
    console.log('按下');
    var usrId=$("#userId").val();
    var number=$("#sale1").val();
    console.log(number);
    loadXMLDoc("/adUpd.servlet?userId="+usrId+"&number="+number+"&name=sale1",adminUserProcessor);
    console.log("结束");
}
//修改sale2数量
function UpdS2() {
    var usrId=$("#userId").val();
    var number=$("#sale2").val();
    loadXMLDoc("/adUpd.servlet?userId="+usrId+"&number="+number+"&name=sale2",adminUserProcessor);
    console.log("结束");
}
// 修改sale3数量
function UpdS3() {
    var usrId=$("#userId").val();
    var number=$("#sale3").val();
    loadXMLDoc("/adUpd.servlet?userId="+usrId+"&number="+number+"&name=sale3",adminUserProcessor);
}

//根据ID查找书籍信息
function findBk() {
    var bookId=$("#bookId").val();
    loadXMLDoc("/adFindBk.servlet?bookId="+bookId,adminBookProcessor);
}
//根据ID下架书籍
function delBk() {
    var bookId=$("#bookId").val();
    loadXMLDoc("/adDelBk.servlet?bookId="+bookId,adminDelProcessor);
    window.alert("删除成功!")
}
//更新库存num
function UpdNum() {
    console.log('按下');
    var bookId=$("#bookId").val();
    var number=$("#booknum").val();
    console.log(number);
    loadXMLDoc("/adUpdBk.servlet?bookId="+bookId+"&number="+number+"&name=num",adminBookProcessor);
    console.log("结束");
}
//更新热度hotnum
function UpdHotnum() {
    console.log('按下');
    var bookId=$("#bookId").val();
    var number=$("#hotnum").val();
    console.log(number);
    loadXMLDoc("/adUpdBk.servlet?bookId="+bookId+"&number="+number+"&name=hotnum",adminBookProcessor);
    console.log("结束");
}
//修改定价price
function UpdPri() {
    console.log('按下');
    var bookId=$("#bookId").val();
    var number=$("#price").val();
    console.log(number);
    loadXMLDoc("/adUpdBk.servlet?bookId="+bookId+"&number="+number+"&name=price",adminBookProcessor);
    console.log("结束");
}
//修改分类category
function UpdCate() {
    console.log('按下');
    var bookId=$("#bookId").val();
    var number=$("#category").val();
    console.log(number);
    loadXMLDoc("/adUpdBk.servlet?bookId="+bookId+"&number="+number+"&name=category",adminBookProcessor);
    console.log("结束");
}

//---

function adminDelProcessor() {
    var responseContext;
    //如果返回成功并取得了响应内容
    if (4 === xmlhttp.readyState && 200 === xmlhttp.status) {
        console.log('完毕');
        responseContext = xmlhttp.responseText;
        //更新购物车上的数字部分,返回的状态码即是sum
        if (responseContext == '-1') {
            window.alert('没有提交ID');
        }
        else if (responseContext == '-2') {
            window.alert('请先登录');
        }
    }
}
//用于book的处理函数
function adminBookProcessor() {
    var responseContext;
    //如果返回成功并取得了响应内容
    if (4 === xmlhttp.readyState && 200 === xmlhttp.status) {
        console.log('完毕');
        responseContext = xmlhttp.responseText;
        //更新购物车上的数字部分,返回的状态码即是sum
        if (responseContext == '-1') {
            window.alert('没有提交ID');
        }
        else if (responseContext == '-2') {
            window.alert('请先登录');
        }
        else {
            console.log(responseContext);
            var words = responseContext.split(' ');
            console.log(words);
            //如果取session,取到的总是页面加载时的
            //FIXME
            $("#bookId").text(words[0]);
            $('#bookname').text(words[1]);
            document.getElementById('booknum').value=words[2];
            document.getElementById('hotnum').value=words[3];
            document.getElementById('price').value=words[4];
            document.getElementById('category').value=parseInt(words[5]);
        }
    }
}