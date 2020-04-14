<%--
  Created by IntelliJ IDEA.
  User: liuweiran
  Date: 2020/4/12
  Time: 8:40 上午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>签到</title>
    <link rel="stylesheet" href="${APP_PATH}/registercss/bootstrap3/css/bootstrap.min.css">
    <link rel="stylesheet" href="${APP_PATH}/registercss/style.css">
    <link rel="stylesheet" href="${APP_PATH}/registercss/qiandao_style.css">
</head>
<body>
<div class="container">
    <div class="headerL">
        <a onclick="javascript:history.back(-1)" class="goback"><img src="${APP_PATH}/images/goback.png" />返回</a>
    </div>
    <div class="row">
        <div class="col-xs-12 clearPadding">
            <div class=""><img src="${APP_PATH}/registerimages/qdBanner.jpg" class="img-responsive"></div>

            <div class="calendar">
                <div class="calenbox">
                    <div id="calendar"></div>
                </div>
                <div class="text-center">
                    <button class="btn btn-qiandao" onClick="signIn()">马上签到</button>
                </div>
            </div>
<%--            <div class="padding10">--%>
<%--                <div class="font16 pb10 borderb"><strong>连续签到礼包</strong></div>--%>
<%--                <div class="libaolist">--%>
<%--                    <div class="clearfix borderb ptb10">--%>
<%--                        <div class="col-xs-9 clearPadding">--%>
<%--                            <div class="media">--%>
<%--                                <a class="media-left pt3" href="javascript:void(0);">--%>
<%--                                    <img src="${APP_PATH}/registerimages/dou.png" style="width:30px;height:30px;">--%>
<%--                                </a>--%>
<%--                                <div class="media-body">--%>
<%--                                    <div class="">5天礼包（200鹿豆）</div>--%>
<%--                                    <div class="text-muted font12">连续签到5天即可领取</div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="col-xs-3 clearPadding text-right pt2">--%>
<%--                            <button class="btn btn-lingqu">领取</button>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="clearfix borderb ptb10">--%>
<%--                        <div class="col-xs-9 clearPadding">--%>
<%--                            <div class="media">--%>
<%--                                <a class="media-left pt3" href="javascript:void(0);">--%>
<%--                                    <img src="${APP_PATH}/registerimages/dou.png" style="width:30px;height:30px;">--%>
<%--                                </a>--%>
<%--                                <div class="media-body">--%>
<%--                                    <div class="">10天礼包（400鹿豆）</div>--%>
<%--                                    <div class="text-muted font12">连续签到10天即可领取</div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="col-xs-3 clearPadding text-right pt2">--%>
<%--                            <button class="btn btn-disable" disable>已领取</button>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="clearfix borderb ptb10">--%>
<%--                        <div class="col-xs-9 clearPadding">--%>
<%--                            <div class="media">--%>
<%--                                <a class="media-left pt3" href="javascript:void(0);">--%>
<%--                                    <img src="${APP_PATH}/registerimages/dou.png" style="width:30px;height:30px;">--%>
<%--                                </a>--%>
<%--                                <div class="media-body">--%>
<%--                                    <div class="">15天礼包（800鹿豆）</div>--%>
<%--                                    <div class="text-muted font12">连续签到15天即可领取</div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="col-xs-3 clearPadding text-right pt2">--%>
<%--                            <button class="btn btn-lingqu">领取</button>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="clearfix borderb ptb10">--%>
<%--                        <div class="col-xs-9 clearPadding">--%>
<%--                            <div class="media">--%>
<%--                                <a class="media-left pt3" href="javascript:void(0);">--%>
<%--                                    <img src="${APP_PATH}/registerimages/dou.png" style="width:30px;height:30px;">--%>
<%--                                </a>--%>
<%--                                <div class="media-body">--%>
<%--                                    <div class="">20天礼包（1200鹿豆）</div>--%>
<%--                                    <div class="text-muted font12">连续签到20天即可领取</div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="col-xs-3 clearPadding text-right pt2">--%>
<%--                            <button class="btn btn-lingqu">领取</button>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="clearfix borderb ptb10">--%>
<%--                        <div class="col-xs-9 clearPadding">--%>
<%--                            <div class="media">--%>
<%--                                <a class="media-left pt3" href="javascript:void(0);">--%>
<%--                                    <img src="${APP_PATH}/registerimages/dou.png" style="width:30px;height:30px;">--%>
<%--                                </a>--%>
<%--                                <div class="media-body">--%>
<%--                                    <div class="">25天礼包（1800鹿豆）</div>--%>
<%--                                    <div class="text-muted font12">连续签到25天即可领取</div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="col-xs-3 clearPadding text-right pt2">--%>
<%--                            <button class="btn btn-lingqu">领取</button>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="clearfix borderb ptb10">--%>
<%--                        <div class="col-xs-9 clearPadding">--%>
<%--                            <div class="media">--%>
<%--                                <a class="media-left pt3" href="javascript:void(0);">--%>
<%--                                    <img src="${APP_PATH}/registerimages/dou.png" style="width:30px;height:30px;">--%>
<%--                                </a>--%>
<%--                                <div class="media-body">--%>
<%--                                    <div class="">30天礼包（3000鹿豆）</div>--%>
<%--                                    <div class="text-muted font12">连续签到30天即可领取</div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="col-xs-3 clearPadding text-right pt2">--%>
<%--                            <button class="btn btn-lingqu">领取</button>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
        </div>
    </div>
</div>
<div class="maskbox"></div>
<div class="qdbox">
    <div class="text-center text-green font18"><strong>签到成功！</strong></div>
    <div class="text-center pt10">您已经连续签到&nbsp;<span class="text-green" id="spantext"></span>&nbsp;天</div>
    <div class="text-center ptb15"><img src="${APP_PATH}/registerimages/gift.png" style="width:125px;margin-left:20px;"></div>
<%--    <div class="text-center"><button class="btn btn-lottery"><a href="turnlate.html" target="_blank">去抽奖</a></button></div>--%>
</div>
<script src="${APP_PATH}/registerjs/jquery-1.10.2.min.js"></script>
<script src="${APP_PATH}/registerjs/calendar.js"></script>
<script src="${APP_PATH }/js/jquery-1.8.1.min.js"></script>
<script>
    function  signIn(){
        $.ajax({
            type:"get",
            url:"${APP_PATH}/user/registersub",
            success:function (result) {
                if (result.success){
                    var num =result.data.continueDay;
                    document.getElementById("spantext").innerHTML = num;
                    //签到成功
                    $(".maskbox").fadeIn();
                    $(".qdbox").fadeIn();
                    $(".maskbox").height($(document).height());
                    registerInfo();
                }else{
                    alert(result.message)
                }
            }
        })

    }
    $(".maskbox").click(function(){
        $(".maskbox").fadeOut();
        $(".qdbox").fadeOut();
    });
    $(function(){
        registerInfo();
    });
    function registerInfo() {
        $.ajax({
            type:"get",
            url:"${APP_PATH}/user/registerInfo",
            success:function (result) {
                if (result.success){
                    // var signList=[{"signDay":"10"},{"signDay":"11"},{"signDay":"12"},{"signDay":"13"}];
                    var signList = result.data;
                    calUtil.init(signList);
                }else{
                    var signList=[{"signDay":"0"}];
                    calUtil.init(signList);
                }
            }
        });
    }
</script>
</body>
</html>
