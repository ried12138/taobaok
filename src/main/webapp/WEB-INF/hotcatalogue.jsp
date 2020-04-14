<%--
 活动热卖
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
<div class="headerbox">
    <div class="header">
        <div class="headerL">
            <a onclick="javascript:history.back(-1)" class="goback"><img src="images/goback.png" /></a>
        </div>
        <div class="headerC0">
            <a><h3>活动热卖</h3></a>
        </div>
        <div class="headerR">
            <a href="javascript:history.back(-1)">取消</a>
        </div>
    </div>
</div>
<div class="clear"></div>
<!-- 导航 -->
<div class="shopType">
    <ul>
        <li id="actualSales" class="on">
            <a onclick="res(1)">实时销量</a>
        </li>
        <li id="buyandbuy">
            <a onclick="res(4)">买了又买</a>
        </li>
        <li id="hottop">
            <a onclick="res(7)">综合热搜排行</a>
<%--            <span id="asc" onclick="priceasc()" style="display:none" class="pricebtn1"></span>--%>
<%--            <span id="des" onclick="pricedes()" style="display:none" class="pricebtn2"></span>--%>
        </li>
    </ul>

</div>
<div class="clear"></div>
<div class="hbox1"></div>
<%--<div id="navBox" >--%>
<%--    <ul class="tab-head">--%>
<%--        <li class="tab-head-item"><a class="tab-head-item" onclick="res(1)">实时销量</a></li>--%>
<%--        <li class="tab-head-item"><a class="tab-head-item" onclick="res(4)">买了又买</a></li>--%>
<%--        <li class="tab-head-item"><a class="tab-head-item" onclick="res(7)">综合热搜排行</a></li>--%>
<%--    </ul>--%>
<%--</div>--%>
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
    <ul id="shoplistbox">
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
    window.onload = function(){
        res(1);
    }
    //列表加载逻辑
    function res(num) {
        $.ajax({
            type:"post",
            url:"${APP_PATH}/hotcatalogue",
            data:{
                num:num
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
                    switch (num) {
                        case 1:
                            $("#actualSales").attr('class','on');
                            $("#buyandbuy").attr('class','off');
                            $("#hottop").attr('class','off');
                            break;
                        case 4:
                            $("#actualSales").attr('class','off');
                            $("#buyandbuy").attr('class','on');
                            $("#hottop").attr('class','off');
                            break;
                        case 7:
                            $("#actualSales").attr('class','off');
                            $("#buyandbuy").attr('class','off');
                            $("#hottop").attr('class','on');
                            break;
                    }

                    $("#shoplistbox").html(contentlist);//局部刷新
                }else{
                    //失败
                }
            }
        })
    }
</script>
</body>
</html>
