<%--
  Created by IntelliJ IDEA.
  User: liuweiran
  Date: 2020/4/2
  Time: 11:44 上午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=0">
    <meta name="renderer" content="webkit"/>
    <meta name="force-rendering" content="webkit"/>
    <script>/*@cc_on window.location.href="http://support.dmeng.net/upgrade-your-browser.html?referrer="+encodeURIComponent(window.location.href); @*/</script>
    <title></title>
    <link type="text/css" rel="stylesheet" href="css/style.css" />
    <script type="text/javascript" src="js/jquery-1.8.1.min.js">
        $(document).ready(function () {
            $(".tolist img").click(function () {
                $(".likebox").toggle();
                $(".shoplist").toggle();
            })

            //筛选
            $('.a_sx').click(function(){
                $("#sxtj").animate({right:"0"},500);
                $('.f_mask').show();
                $("body").css({'height':'100%','overflow':'hidden'});
                //$("body").css{}
            })

            $('.sx_3 a').click(function(){
                $('.f_mask').hide();
                $('#sxtj').animate({right:"-85%"},500);
                $("body").css({'height':'auto','overflow':''});
            })

            $('.f_mask').click(function(){
                $('.f_mask').hide();
                $('#sxtj').animate({right:"-85%"},500);
                $("body").css({'height':'auto','overflow':''});
            })
        })
    </script>
</head>
<body>
<%--<div class="headerbox">--%>
<%--    <div class="header">--%>
<%--        <div class="headerL">--%>
<%--            <a onclick="javascript:history.back(-1)" class="goback"><img src="images/goback.png" /></a>--%>
<%--        </div>--%>
<%--        <div class="headerC0">--%>
<%--            <a href="seacher.html" style="display:block; width:100%; height:100%"></a>--%>
<%--        </div>--%>
<%--        <div class="headerR">--%>
<%--            <a href="javascript:void()">取消</a>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<%--<div class="clear"></div>--%>

<!-- 导航 -->
<div id="navBox" >
    <ul class="tab-head">
        <li class="tab-head-item"><a class="tab-head-item" onclick="reqpage('','-1')">精选</a></li>
        <li class="tab-head-item"><a class="tab-head-item" onclick="reqpage('','1')">居家百货</a></li>
        <li class="tab-head-item"><a class="tab-head-item" onclick="reqpage('','2')">美食</a></li>
        <li class="tab-head-item"><a class="tab-head-item" onclick="reqpage('','3')">服饰</a></li>
        <li class="tab-head-item"><a class="tab-head-item" onclick="reqpage('','5')">美妆</a></li>
        <li class="tab-head-item"><a class="tab-head-item" onclick="reqpage('','6')">内衣</a></li>
        <li class="tab-head-item"><a class="tab-head-item" onclick="reqpage('','7')">母婴</a></li>
        <li class="tab-head-item"><a class="tab-head-item" onclick="reqpage('','9')">数码配件</a></li>
    </ul>
</div>
<%--<div class="shopType">--%>
<%--    <ul>--%>
<%--        <li class="on">--%>
<%--            <a href="shoplist.html">精选</a>--%>
<%--        </li>--%>
<%--        <li>--%>
<%--            <a href="shoplist.html">居家百货</a>--%>
<%--        </li>--%>
<%--        <li>--%>
<%--            <a href="shoplist.html">美食</a>--%>
<%--        </li>--%>
<%--        <li>--%>
<%--            <a href="shoplist.html">服饰</a>--%>
<%--        </li>--%>
<%--        <li>--%>
<%--            <a href="shoplist.html">母婴</a>--%>
<%--        </li>--%>
<%--    </ul>--%>
<%--</div>--%>
<%--<div class="clear"></div>--%>
<%--<div class="hbox1"></div>--%>
<%--<div class="tolist"><img src="images/tolist.png" /></div>--%>
<div class="totop"><a href="javascript:scrollTo(0,0)"><img src="images/totop.png" /></a></div>
<div class="kbox"></div>
<%--<div class="likebox">--%>
<%--    <ul>--%>
<%--        <li>--%>
<%--            <a href="xq.html">--%>
<%--                <img src="images/dp3.png" class="proimg"/>--%>
<%--                <p class="tit">三利 毛巾家纺纯棉吸水 提缎面巾两条装</p>--%>
<%--                <p class="price">￥29.9<span>￥49.9</span><img src="images/f3.png" /></p>--%>
<%--            </a>--%>
<%--        </li>--%>
<%--</div>--%>
<div class="shoplist">
    <ul id="shoplistbox1">
    </ul>
    <ul id="shoplistbox2">
    </ul>
    <ul id="shoplistbox3">
    </ul>
    <ul id="shoplistbox4">
    </ul>
    <ul id="shoplistbox5">
    </ul>
    <ul id="shoplistbox6">
    </ul>
    <ul id="shoplistbox7">
    </ul>
</div>
<%--<div class="sxbox">--%>
<%--    <div class="sxbox0">--%>
<%--        <div class="f_mask"></div>--%>
<%--        <div id="sxtj">--%>
<%--            <div class="sx_1">筛选</div>--%>
<%--            <div class="sx_2">--%>
<%--                <p class="tit">品牌</p>--%>
<%--                <a href="javascript:void()">名斓</a>--%>
<%--                <a href="javascript:void()">奥蒂莉亚</a>--%>
<%--                <a href="javascript:void()">GCU</a>--%>
<%--                <a href="javascript:void()">漫香农</a>--%>
<%--                <a href="javascript:void()">蒂满庭</a>--%>
<%--                <a href="javascript:void()">DearWhite</a>--%>
<%--            </div>--%>
<%--            <div class="sx_2">--%>
<%--                <p class="tit">类别</p>--%>
<%--                <a href="javascript:void()">婚纱</a>--%>
<%--            </div>--%>
<%--            <div class="sx_2">--%>
<%--                <p class="tit">折扣和服务</p>--%>
<%--                <a href="javascript:void()">包邮</a>--%>
<%--                <a href="javascript:void()">赠送运费险</a>--%>
<%--                <a href="javascript:void()">消费者保障</a>--%>
<%--                <a href="javascript:void()">全球购</a>--%>
<%--                <a href="javascript:void()">7天内退货</a>--%>
<%--                <a href="javascript:void()">通用排序</a>--%>
<%--            </div>--%>
<%--            <div class="sx_2">--%>
<%--                <p class="tit">价格区间</p>--%>
<%--                <div class="pric">--%>
<%--                    <input name="" type="text" /><label>-</label><input name="" type="text" />--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="sx_3">--%>
<%--                <a href="javascript:void()">确定</a>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<script type="text/javascript">
    var page =1;
    var roll ="roll";
    var nineCid = "-1";
    window.onload = function(){
        reqpage(roll,nineCid);
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
            reqpage(roll,nineCid);

        }
    }
    //列表加载逻辑
    function reqpage(roll,nineCid) {
        if (page >= 7) {
            var con = '';
            con += '<li>';
            con += ' <a>';
            con += '<p>已经到底了</p>';
            con += '</a>';
            con += '</li>';
            $("#shoplistbox7").html(con);
        } else {
            if (roll == "") {
                nineCid = nineCid;
                scrollTo(0, 0)
                $("#shoplistbox2").html("");//局部刷新
                $("#shoplistbox3").html("");
                $("#shoplistbox4").html("");
                $("#shoplistbox5").html("");
                $("#shoplistbox6").html("");
                var scrollTop = 0;
                var windowHeight = 0;
                page = 1;            //初始化页码
            }
            nineCid = nineCid;
        }
        $.ajax({
            type:"post",
            url:"${APP_PATH}/jiukuaijiulist",
            data:{
                pageId:page,
                pageSize:50,
                nineCid:nineCid
            },
            success:function(result){
                if (result.success){
                    var contentlist = '';
                    $.each(result.data,function (i,lists) {
                        contentlist+='<li>';
                        contentlist+='   <a href="${APP_PATH}/item?id='+lists.goodsId+'">';
                        contentlist+='       <div class="listL"><img src="'+lists.mainPic+'" /></div>';
                        contentlist+='       <div class="listR">';
                        contentlist+='           <div class="v1">'+lists.title+'</div>';
                        contentlist+='           <div class="v3">';
                        contentlist+='               <p class="p1">￥'+lists.actualPrice+'<span>￥'+lists.originalPrice+'</span></p>';
                        contentlist+='               <p class="p2">'+lists.dailySales+'人付款</p>';
                        contentlist+='           </div>';
                        contentlist+='       </div>';
                        contentlist+='   </a>';
                        contentlist+='</li>';
                    })
                    switch (page) {
                        case 1:
                            $("#shoplistbox1").html(contentlist);//局部刷新
                            page = 1+1;
                            break;
                        case 2:
                            $("#shoplistbox2").html(contentlist);//局部刷新
                            page = 2+1;
                            break;
                        case 3:
                            $("#shoplistbox3").html(contentlist);//局部刷新
                            page = 3+1;
                            break;
                        case 4:
                            $("#shoplistbox4").html(contentlist);//局部刷新
                            page = 4+1;
                            break;
                        case 5:
                            $("#shoplistbox5").html(contentlist);//局部刷新
                            page = 5+1;
                            break;
                        case 6:
                            $("#shoplistbox6").html(contentlist);//局部刷新
                            aaa = 6+1;
                            break;
                    }
                }
            }
        })
    }
</script>
</body>
</html>
