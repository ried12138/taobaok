<%--
  Created by IntelliJ IDEA.
  User: liuweiran
  Date: 2020/4/7
  Time: 4:27 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=0">
    <meta name="renderer" content="webkit"/>
    <meta name="force-rendering" content="webkit"/>
    <script>/*@cc_on window.location.href="http://support.dmeng.net/upgrade-your-browser.html?referrer="+encodeURIComponent(window.location.href); @*/</script>
    <title></title>
    <link type="text/css" rel="stylesheet" href="../css/style.css" />
    <script type="text/javascript" src="${APP_PATH}/js/jquery-1.8.1.min.js"></script>
</head>

<body>
<div class="m0myheader">
    <div class="conbox">
        <div class="conboxL">
            <img src="../images/tx.png" class="tt"/>
            <div class="btR">
                <p class="p1">${sessionScope.userinfo.name}</p>
                <div class="v1">
                    <img src="../images/VIP.png" />
                    <p class="p1">尚未开通vip</p>
                </div>
            </div>
        </div>
        <div class="conboxR">
<%--            <a href="shezhi.html">设置</a>--%>
            <a href="${APP_PATH}/user/outuser">退出账号</a>
        </div>
        <div class="clear"></div>
    </div>
    <div class="conbox2">
        <ul>
            <li>
                <a href="${APP_PATH }/user/collection">
                    <p class="p1">${sessionScope.userinfo.collectionNum}</p>
                    <p class="p2">收藏夹</p>
                </a>
            </li>
            <li>
                <a href="javascript:void()">
                    <p class="p1">${sessionScope.userinfo.score}</p>
                    <p class="p2">我的积分</p>
                </a>
            </li>
<%--            <li>--%>
<%--                <a href="javascript:void()">--%>
<%--                    <p class="p1">3</p>--%>
<%--                    <p class="p2">浏览记录</p>--%>
<%--                </a>--%>
<%--            </li>--%>
        </ul>
    </div>
</div>
<div class="clear"></div>
<%--<div class="mypart1">--%>
<%--    <ul>--%>
<%--        <li>--%>
<%--            <a href="jifen.html">--%>
<%--                <p class="p1">0</p>--%>
<%--                <p class="p2">我的积分</p>--%>
<%--            </a>--%>
<%--        </li>--%>
<%--        <li>--%>
<%--            <a href="quanNews1.html">--%>
<%--                <p class="p1">1</p>--%>
<%--                <p class="p2">优惠券</p>--%>
<%--            </a>--%>
<%--        </li>--%>
<%--        <li>--%>
<%--            <a href="allDd.html">--%>
<%--                <p class="p1">0.00</p>--%>
<%--                <p class="p2">订单数量</p>--%>
<%--            </a>--%>
<%--        </li>--%>
<%--        <li>--%>
<%--            <a href="allDd.html">--%>
<%--                <p class="p1">0.00</p>--%>
<%--                <p class="p2">支付订单</p>--%>
<%--            </a>--%>
<%--        </li>--%>
<%--        <li>--%>
<%--            <a href="allDd.html">--%>
<%--                <img src="../images/my01.png" />--%>
<%--                <p class="p2">消费记录</p>--%>
<%--            </a>--%>
<%--        </li>--%>
<%--    </ul>--%>
<%--</div>--%>
<%--<div class="kbox"></div><div class="kbox"></div>--%>
<div class="clear"></div>
<%--<div class="mypart2">--%>
<%--    <div class="con">--%>
<%--        <div class="pa2_tit">--%>
<%--            <p>我的订单</p>--%>
<%--            <a href="allDd.html">查看更多订单 ></a>--%>
<%--        </div>--%>
<%--        <ul>--%>
<%--            <li>--%>
<%--                <a href="allDd.html">--%>
<%--                    <div class="ddimg">--%>
<%--                        <img src="../images/my02.png" />--%>
<%--                    </div>--%>
<%--                    <p>待付款</p>--%>
<%--                </a>--%>
<%--            </li>--%>
<%--            <li>--%>
<%--                <a href="allDdfhno.html">--%>
<%--                    <div class="ddimg">--%>
<%--                        <img src="../images/my03.png" />--%>
<%--                    </div>--%>
<%--                    <p>待发货</p>--%>
<%--                </a>--%>
<%--            </li>--%>
<%--            <li>--%>
<%--                <a href="allDdshno.html">--%>
<%--                    <div class="ddimg">--%>
<%--                        <img src="../images/my04.png" />--%>
<%--                    </div>--%>
<%--                    <p>待收货</p>--%>
<%--                </a>--%>
<%--            </li>--%>
<%--            <li>--%>
<%--                <a href="allDdpjno.html">--%>
<%--                    <div class="ddimg">--%>
<%--                        <img src="../images/my05.png" />--%>
<%--                        <div class="num">2</div>--%>
<%--                    </div>--%>
<%--                    <p>待评价</p>--%>
<%--                </a>--%>
<%--            </li>--%>
<%--            <li>--%>
<%--                <a href="allDd.html">--%>
<%--                    <div class="ddimg">--%>
<%--                        <img src="../images/my06.png" />--%>
<%--                    </div>--%>
<%--                    <p>退款/售后</p>--%>
<%--                </a>--%>
<%--            </li>--%>
<%--        </ul>--%>
<%--    </div>--%>
<%--</div>--%>
<%--<div class="kbox"></div><div class="kbox"></div>--%>
<%--<div class="clear"></div>--%>
<%--<div class="mypart2">--%>
<%--    <div class="con">--%>
<%--        <div class="pa2_tit">--%>
<%--            <p>我的优惠券</p>--%>
<%--            <a href="quanNews1.html">查看更多订单 ></a>--%>
<%--        </div>--%>

<%--    </div>--%>
<%--</div>--%>
<div class="clear"></div>
<div class="kbox"></div><div class="kbox"></div>
<div class="clear"></div>
<div class="mypart3">
    <ul>
        <li>
            <a href="${APP_PATH}/user/register">
                <img src="../images/my9.png" />
                <p>签到领积分</p>
            </a>
        </li>
        <li>
            <a onclick="qunpopup()">
                <img src="${APP_PATH}/images/redqun.png" />
                <p>红包微信群</p>
            </a>
        </li>
<%--        <li>--%>
<%--            <a href="javascript:void()">--%>
<%--                <img src="../images/my13.png" />--%>
<%--                <p>客户服务</p>--%>
<%--            </a>--%>
<%--        </li>--%>
<%--        <li>--%>
<%--            <a href="javascript:void()">--%>
<%--                <img src="../images/my14.png" />--%>
<%--                <p>京东超市</p>--%>
<%--            </a>--%>
<%--        </li>--%>
<%--        <li>--%>
<%--            <a href="quanNews1.html">--%>
<%--                <img src="../images/my7.png" />--%>
<%--                <p>我的优惠券</p>--%>
<%--            </a>--%>
<%--        </li>--%>
<%--        <li>--%>
<%--            <a href="addressGL.html">--%>
<%--                <img src="../images/my8.png" />--%>
<%--                <p>收获地址</p>--%>
<%--            </a>--%>
<%--        </li>--%>
        <li>
            <a onclick="popup()">
                <img src="../images/gongzhonhao.png" />
                <p>我的公众号</p>
            </a>
        </li>
        <li>
            <a href="javascript:void()">
                <img src="../images/codeing.png" />
                <p>开发中...</p>
            </a>
        </li>
    </ul>
</div>
<div id="wechatqunBox" style="display: none;"><h3 align="center" style="text-decoration:underline;color:red;">点击图片关闭</h3><a onclick="quncloseP()"><img src="${APP_PATH}/images/wechatqun.png" /></a></div>
<div id="wechatBox" style="display: none;"><h3 align="center" style="text-decoration:underline;color:red;">点击图片关闭</h3><a onclick="closeP()"><img src="${APP_PATH}/images/wechat.jpg" /></a></div>
<div class="clear"></div>
<%--<div class="kbox"></div><div class="kbox"></div>--%>
<%--<div class="clear"></div>--%>
<%--<div class="mypart2">--%>
<%--    <div class="con">--%>
<%--        <div class="pa2_tit">--%>
<%--            <p>天猫超市卡</p>--%>
<%--            <a href="javascript:void()">立刻充值 ></a>--%>
<%--        </div>--%>
<%--        <div class="pa2con">--%>
<%--            <img src="../images/my00.jpg" />--%>
<%--            <p>账户余额：￥0.00</p>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<div class="kbox"></div><div class="kbox"></div>
<div class="clear"></div>
<div class="mypart4">
    <img src="../images/my15.png" />
</div>
<div class="likebox my">
    <ul id="tuijianshop">
    </ul>
    <ul id="tuijianshop1">
    </ul>
    <ul id="tuijianshop2">
    </ul>
    <ul id="tuijianshop3">
    </ul>
</div>
<div class="clear"></div>
<div class="fbox"></div>
<div class="footbox">
    <div class="footer">
        <ul>
            <li>
                <a href="${APP_PATH}/index">
                    <img src="../images/f01.png" />
                    <p>首页</p>
                </a>
            </li>
            <li>
                <a href="${APP_PATH}/category">
                    <img src="../images/f02.png" />
                    <p>分类</p>
                </a>
            </li>
            <li>
                <a href="${APP_PATH }/user/collection">
                    <img src="../images/f03.png" />
                    <p>收藏</p>
                </a>
            </li>
            <li class="on">
                <a href="${APP_PATH }/user/login">
                    <img src="../images/f4.png" />
                    <p>我的</p>
                </a>
            </li>
        </ul>
    </div>
</div>
<script type="text/javascript">
    var page =1;

    window.onload = function(){
        xiangguantuijian();
    }
    var scrollTop = 0;
    var windowHeight = 0;
    window.onscroll = function () {
        //scrollTop就是触发滚轮事件时滚轮的高度
        var scrollTop = document.documentElement.scrollTop || document.body.scrollTop;
        // console.log("滚动距离" + scrollTop);
        //变量windowHeight是可视区的高度
        var windowHeight = document.documentElement.clientHeight || document.body.clientHeight;
        // console.log("可视高度" + windowHeight);
        //变量scrollHeight是滚动条的总高度
        var scrollHeight = document.documentElement.scrollHeight || document.body.scrollHeight;

        console.log("总高度" + scrollHeight);
        //判断滚动条是否到底部
        if (scrollTop + windowHeight == scrollHeight) {
            xiangguantuijian();
        }
    }
    function xiangguantuijian(){
       $.ajax({
           type:"post",
           url:"${APP_PATH}/Recommend",
           data:{
               pageId:page
           },
           success:function (result) {
               if (result.success){
                   //获取成功
                   var content = '';
                   $.each(result.data,function (i,list) {
                       content+='<li>';
                       content+='    <a href="${APP_PATH}/item?id='+list.goodsId+'">';
                       content+='        <img src="'+list.mainPic+'" class="proimg"/>';
                       content+='        <p class="tit">'+list.title+'</p>';
                       content+='        <p class="price">￥'+list.actualPrice+'<span>￥'+list.originalPrice+'</span><img src="../../images/f3.png" /></p>';
                       content+='    </a>';
                       content+='</li>';
                   })
                   switch (page) {
                       case 1:
                           $("#tuijianshop").html(content); //局部刷新
                           page = 1+1;
                           break;
                       case 2:
                           $("#tuijianshop1").html(content); //局部刷新
                           page = 2+1;
                           break;
                       case 3:
                           $("#tuijianshop2").html(content); //局部刷新
                           page = 3+1;
                           break;
                       case 4:
                           $("#tuijianshop3").html(content); //局部刷新
                           page = 4+1;
                           break;
                   }
               }
           }
       })
    }
    /*弹窗功能*/
    function popup() {
        var wxb = document.getElementById("wechatBox");//大图
        wxb.style.display = "block";
    }
    /*关闭e799bee5baa6e997aee7ad94e78988e69d8331333365633965弹窗功能*/
    function closeP() {
        var wxb = document.getElementById("wechatBox");//大图
        wxb.style.display = "none";
    }

    function qunpopup() {
        var wxb = document.getElementById("wechatqunBox");//大图
        wxb.style.display = "block";
    }
    /*关闭e799bee5baa6e997aee7ad94e78988e69d8331333365633965弹窗功能*/
    function quncloseP() {
        var wxb = document.getElementById("wechatqunBox");//大图
        wxb.style.display = "none";
    }
</script>
</body>
</html>
