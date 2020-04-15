<%--
  Created by IntelliJ IDEA.
  User: liuweiran
  Date: 2020/4/7
  Time: 4:42 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html><head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>领券分享登陆</title>
    <link rel="stylesheet" href="../css/person_style.css" type="text/css">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=0">
    <script charset="utf-8" ></script>
    <script type="text/javascript" src="../js/open.js"></script>
    <script type="text/javascript" src="../js/jquery.js"></script>
</head>
<body>
<div class="viewport">
    <header class="person_top">
        <a onclick="javascript:history.back(-1)" class="goback"><img src="../images/goback.png" />返回</a>
    </header>
    <div class="top_word">登录</div>
    <a id="errorinfo"></a>
    <div class="person_main">
        <div class="login_list">
            <ul>
                <li><span class="icon icon_phone"></span><input name="" type="phone" id="phone" class="login_text" placeholder="手机号"></li><a id="notphone" style="color:red"></a>
                <li><span class="icon icon_pw"></span><input name="" type="password" id="password" class="login_text" placeholder="密码"></li><a id="notpws" style="color:red"></a>
                <li><span class="icon icon_yzm"></span><input name="" id="checkCode" type="text" class="login_text login_text_yzm" placeholder="验证码"><span class="login_yzm"><img id="captchaImage" src="${APP_PATH}/user/checkCode" onclick="changeImage()" id="validataImage"></span></li><a id="notcode" style="color:red"></a>
            </ul>
            <div class="clear"></div>
        </div>
        <div class="person_botton margin_top30 person_red_botton"><a id="doSubmit" onclick="dosubmit()">登 录</a></div>
        <div class="login_word color_66"><span class="gorget"><a href="javascript:void(0)javascript:forgetPassword();">忘记密码？</a></span><span class="register"><a href="${APP_PATH}/user/sign">注册账号</a></span></div>
<%--        <div class="login_other_name color_66">使用合作网站账号登录</div>--%>
<%--        <div class="login_other_list">--%>
<%--            <ul>--%>
<%--                <li><a href="javascript:void(0)javascript:partnerlogin('taobao');" class="taobao"></a></li>--%>
<%--                <li><a href="javascript:void(0)javascript:partnerlogin('sinawb');" class="weibo"></a></li>--%>
<%--                <li><a href="javascript:void(0)javascript:partnerlogin('qq');" class="qq"></a></li>--%>
<%--                <li><a href="javascript:void(0)javascript:partnerlogin('alipay');" class="zfb"></a></li>--%>
<%--            </ul>--%>
<%--        </div>--%>
    </div>
</div>
<script type="text/javascript">
    $("#doSubmit").attr("disabled",false);
    var phonenumber = /^[1][3,4,5,7,8][0-9]{9}$/;                           //手机号校验
    function changeImage() {
        $("#captchaImage").attr({"src":"${pageContext.request.contextPath }/user/checkCode?w="+Math.random()})
    }
    function dosubmit() {
        var phone = $("#phone").val();                            //手机号
        var password = $("#password").val();                      //密码
        var checkCode = $("#checkCode").val();                    //验证码
        if (phone ==''){
            $("#errorinfo").html("");
            $("#notphone").html("手机号不能为空");
            $("#notpwd").html("");
            $("#notcode").html("");
        }else if(phone.length != 11){
            $("#errorinfo").html("");
            $("#notphone").html("请输入11位手机号");
            $("#notpwd").html("");
            $("#notcode").html("");
        }else if(!phonenumber.test(phone)){
            $("#errorinfo").html("");
            $("#notphone").html("手机号格式不正确");
            $("#notpwd").html("");
            $("#notcode").html("");
        }else if (password.length < 6){
            $("#errorinfo").html("");
            $("#notphone").html("");
            $("#notpwd").html("密码长度不能少于6位");
            $("#notcode").html("");
        }else if (checkCode ==''){
            $("#errorinfo").html("");
            $("#notphone").html("");
            $("#notpwd").html("");
            $("#notcode").html("验证码不能为空");
        }else{
            //提交登陆信息
            $.ajax({
                type:"post",
                url:"${APP_PATH}/user/logininfo",
                data:{
                    phone:phone,
                    password:password,
                    checkCode:checkCode
                },
                success:function (result) {
                    if (result.success){
                        //登陆成功
                        $("#doSubmit").html("登陆成功...");
                        window.location.href="${APP_PATH }/user/login";
                    }else{
                        //登陆失败
                        switch (result.data) {
                            case 1:
                                $("#errorinfo").html(result.message);
                                $("#notphone").html("");
                                $("#notpwd").html("");
                                $("#notcode").html("");
                                break;
                            case 2:
                                $("#errorinfo").html("");
                                $("#notphone").html("");
                                $("#notpwd").html("");
                                $("#notcode").html(result.message);
                                break
                        }

                    }
                }
            })
        }
    }
</script>
<jsp:include page="zhanzhangtongji.jsp"/>
</body>
</html>
