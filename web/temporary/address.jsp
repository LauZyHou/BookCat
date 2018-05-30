﻿<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <%--<script src="../WEB-RELY/addressJD/jquery-1.11.3.min.js"></script>--%>
    <script src="../WEB-RELY/addressJD/Popt.js"></script>
    <script src="../WEB-RELY/addressJD/cityJson.js"></script>
    <script src="../WEB-RELY/addressJD/citySet.js"></script>
    <style type="text/css">
        ._citys {
            width: 450px;
            display: inline-block;
            border: 2px solid #eee;
            padding: 5px;
            position: relative;
            background-color: #efefe9;
        }

        ._citys span {
            color: #56b4f8;
            height: 15px;
            width: 15px;
            line-height: 15px;
            text-align: center;
            border-radius: 3px;
            position: absolute;
            right: 10px;
            top: 10px;
            border: 1px solid #56b4f8;
            cursor: pointer;
        }

        ._citys0 {
            width: 100%;
            height: 34px;
            display: inline-block;
            border-bottom: 2px solid #56b4f8;
            padding: 0;
            margin: 0;
        }

        ._citys0 li {
            display: inline-block;
            line-height: 34px;
            font-size: 15px;
            color: #888;
            width: 80px;
            text-align: center;
            cursor: pointer;
        }

        .citySel {
            background-color: #56b4f8;
            color: #fff !important;
        }

        ._citys1 {
            width: 100%;
            display: inline-block;
            padding: 10px 0;
        }

        ._citys1 a {
            width: 83px;
            height: 35px;
            display: inline-block;
            background-color: #f5f5f5;
            color: #666;
            margin-left: 6px;
            margin-top: 3px;
            line-height: 35px;
            text-align: center;
            cursor: pointer;
            font-size: 13px;
            overflow: hidden;
        }

        ._citys1 a:hover {
            color: #fff;
            background-color: #56b4f8;
        }

        .AreaS {
            background-color: #56b4f8 !important;
            color: #fff !important;
        }
    </style>
</head>
<body>
<div style="text-align: center">
    <label for="city">所在城市</label>
    <input type="text" id="city"/>
    <br>
    <label for="detail">具体地址</label>
    <input type="text" id="detail"/>
    <br>
    <label for="tel">电话号码</label>
    <input type="text" id="tel"/>
</div>
<script type="text/javascript">
    $("#city").click(function (e) {
        SelCity(this, e);
    });
</script>
</body>
</html>
