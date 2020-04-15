<%--
  Created by IntelliJ IDEA.
  User: liuweiran
  Date: 2020/4/8
  Time: 3:09 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <meta charset=utf-8 />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>注册</title>
    <link rel="stylesheet" href="../css/person_style.css" type="text/css"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=0">
    <meta name="apple-touch-fullscreen" content="yes">
    <meta name="baidu-tc-cerfication" content="13b087439fd56802097fa357b9583e45">
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="black" name="apple-mobile-web-app-status-bar-style">
    <!-- 禁止数字串被处理为电话号码 -->
    <meta name="format-detection" content="telephone=no">
    <script type="text/javascript" src="../js/cpa-cookie.js"></script>
    <script type="text/javascript" src="../js/open.js"></script>
    <script type="text/javascript" src="../js/jquery.js"></script>
</head>
<body>
<input type="hidden" id="inviter" value=""/>
<input type="hidden" id="zyc_act_id" value=""/>
<div class="viewport">
    <header class="person_top">
    <a onclick="javascript:history.back(-1)" class="goback"><img src="../images/goback.png" />返回</a>
    </header>
    <div class="top_word">注册</div>
    <a id="errorinfo"></a>
    <div class="person_main">
        <div class="login_list">
            <ul>
                <li><span class="icon icon_mail" ></span><input id="email" name="" type="text" class="login_text" placeholder="邮箱地址"></li><a id="notemail" style="color:red"></a>
                <li><span class="icon icon_name"></span><input id="name" name="" type="text" class="login_text" placeholder="姓名"></li><a id="notname" style="color:red"></a>
                <li><span class="icon icon_phone"></span><input id="phone" name="" type="text" maxlength="11" class="login_text" placeholder="手机号" onblur="validatephone();"></li><a id="notphone" style="color:red"></a>
                <li><span class="icon icon_pw"></span><input id="password" name="" type="password" maxlength="16" class="login_text" placeholder="密码"></li><a id="notpwd" style="color:red"></a>
                <li><span class="icon icon_pw"></span><input id="passwords" name="" type="password" maxlength="16" class="login_text" placeholder="确认密码"></li><a id="notpwds" style="color:red"></a>
                <li><span class="icon icon_sex"></span>性别：<input id="boy" name="sex" type="radio" checked="checked" value="1">男<input id="girl" name="sex" type="radio" value="0" >女</li>
                <li><span class="icon icon_yzm"></span><input name="" id="checkCode" type="text" class="login_text login_text_yzm" placeholder="验证码"><span class="login_yzm"><img id="captchaImage" src="${APP_PATH}/user/checkCode" onclick="changeImage()" id="validataImage"></span></li><a id="notcode" style="color:red"></a>
            </ul>
            <div class="clear"></div>
        </div>
        <div class="person_botton margin_top30 person_red_botton"><a  id="doSubmit" onclick="dosubmit()">注 册</a></div>
    </div>
</div>
<script type="text/javascript">
    function changeImage() {
        $("#captchaImage").attr({"src":"${pageContext.request.contextPath }/user/checkCode?w="+Math.random()})
    }
    var reyx= /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;        //邮箱校验格式
    var txt = /^[\u4E00-\u9FA5]{2,4}$/;                                     //姓名校验
    var phonenumber = /^[1][3,4,5,7,8][0-9]{9}$/;                           //手机号校验
    function dosubmit() {
        var email = $("#email").val();                            //邮箱地址
        var name = $("#name").val();                              //姓名
        var phone = $("#phone").val();                            //手机号
        var password = $("#password").val();                      //密码
        var passwords = $("#passwords").val();                    //确认密码
        var checkCode = $("#checkCode").val();                    //验证码
        var sexs = document.getElementsByName("sex");
        var sex;                                                  //性别
        for (var i = 0;i < sexs.length;i++){
            if (sexs[i].checked){
                sex = sexs[i].value
            }
        }
        if (email == ''){
            $("#errorinfo").html("");
            $("#notemail").html("邮箱地址不能为空");
            $("#notname").html("");
            $("#notphone").html("");
            $("#notpwd").html("");
            $("#notpwds").html("");
            $("#notcode").html("");
        }else if (!reyx.test(email)){
            $("#errorinfo").html("");
            $("#notemail").html("邮箱格式不正确");
            $("#notname").html("");
            $("#notphone").html("");
            $("#notpwd").html("");
            $("#notpwds").html("");
            $("#notcode").html("");
        }else if (name ==''){
            $("#errorinfo").html("");
            $("#notemail").html("");
            $("#notname").html("姓名不能为空");
            $("#notphone").html("");
            $("#notpwd").html("");
            $("#notpwds").html("");
            $("#notcode").html("");
        }else if (!txt.test(name)){
            $("#errorinfo").html("");
            $("#notemail").html("");
            $("#notname").html("姓名必须是中文,不能有符号空格");
            $("#notphone").html("");
            $("#notpwd").html("");
            $("#notpwds").html("");
            $("#notcode").html("");
        }else if (phone ==''){
            $("#errorinfo").html("");
            $("#notemail").html("");
            $("#notname").html("");
            $("#notphone").html("手机号不能为空");
            $("#notpwd").html("");
            $("#notpwds").html("");
            $("#notcode").html("");
        }else if(phone.length != 11){
            $("#errorinfo").html("");
            $("#notemail").html("");
            $("#notname").html("");
            $("#notphone").html("请输入11位手机号");
            $("#notpwd").html("");
            $("#notpwds").html("");
            $("#notcode").html("");
        }else if(!phonenumber.test(phone)){
            $("#errorinfo").html("");
            $("#notemail").html("");
            $("#notname").html("");
            $("#notphone").html("手机号格式不正确");
            $("#notpwd").html("");
            $("#notpwds").html("");
            $("#notcode").html("");
        }else if (password.length < 6){
            $("#errorinfo").html("");
            $("#notemail").html("");
            $("#notname").html("");
            $("#notphone").html("");
            $("#notpwd").html("密码长度不能少于6位，最长16位");
            $("#notpwds").html("");
            $("#notcode").html("");
        }else if (password != passwords){
            $("#errorinfo").html("");
            $("#notemail").html("");
            $("#notname").html("");
            $("#notphone").html("");
            $("#notpwd").html("");
            $("#notpwds").html("两次密码输入不一样，请检查后重新提交");
            $("#notcode").html("");
        }else{
            //执行请求提交数据
            $.ajax({
                type:"post",
                url:"${APP_PATH}/user/subinfo",
                data:{
                    email:email,
                    name:name,
                    phone:phone,
                    password:password,
                    sex:sex,
                    checkCode:checkCode
                },
                success:function (result) {
                    if (result.success){
                        $("#errorinfo").html("");
                        $("#notemail").html("");
                        $("#notname").html("");
                        $("#notphone").html("");
                        $("#notpwd").html("");
                        $("#notpwds").html("");
                        $("#notcode").html("");
                        alert(result.message);
                        window.location.href="${APP_PATH }/user/login";
                    }else{
                        switch (result.data) {
                            case 1:
                                $("#errorinfo").html(result.message);
                                $("#notemail").html("");
                                $("#notname").html("");
                                $("#notphone").html("");
                                $("#notpwd").html("");
                                $("#notpwds").html("");
                                $("#notcode").html("");
                                break;
                            case 2:
                                $("#errorinfo").html("");
                                $("#notemail").html("");
                                $("#notname").html("");
                                $("#notphone").html("");
                                $("#notpwd").html("");
                                $("#notpwds").html("");
                                $("#notcode").html(result.message); //局部刷新
                                break;
                            case 3:
                                $("#errorinfo").html("");
                                $("#notemail").html("");
                                $("#notname").html("");
                                $("#notphone").html(result.message);    //局部刷新
                                $("#notpwd").html("");
                                $("#notpwds").html("");
                                $("#notcode").html("");
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