<%--
  Created by IntelliJ IDEA.
  User: liuweiran
  Date: 2020/3/26
  Time: 4:27 下午
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
    <script type="text/javascript" src="js/jquery-1.8.1.min.js"></script>
    <script type="text/javascript">
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
<div class="headerbox">
    <div class="header">
        <div class="headerL">
            <a onclick="javascript:history.back(-1)" class="goback"><img src="images/goback.png" /></a>
        </div>
        <div class="headerC0">
            <a id="word" style="display:block; width:100%; height:100%" >${requestScope.wordName}</a>
        </div>
        <div class="headerR">
            <a href="${APP_PATH }/search">取消</a>
        </div>
    </div>
</div>
<div class="clear"></div>
<div class="shopType">
    <ul>
        <li id="comp" class="on">
            <a onclick="reqpage('','default')">综合</a>
        </li>
        <li id="sales">
            <a onclick="reqpage('','total_sales_des')">销量</a>
        </li>
        <li id="price">
            <a onclick="reqpage('','price_asc')">价格</a>
            <span id="asc" onclick="priceasc()" class="pricebtn1"></span>
            <span id="des" onclick="pricedes()" class="pricebtn2"></span>
        </li>
<%--        <li>--%>
<%--            <a href="dplist.html">店铺</a>--%>
<%--        </li>--%>
<%--        <li>--%>
<%--            <a href="javascript:void()" class="a_sx">筛选</a>--%>
<%--        </li>--%>
    </ul>
</div>
<div class="clear"></div>
<div class="hbox1"></div>
<div class="tolist"><img src="images/tolist.png" /></div>
<div class="totop"><a href="javascript:scrollTo(0,0)"><img src="images/totop.png" /></a></div>
<div class="kbox"></div>
<div class="likebox">
    <ul id="shoplikebox1">
<%--            <c:forEach items="${requestScope.shop }" var="list">--%>
<%--                <li>--%>
<%--                    <a href="${APP_PATH}/item?id=${list.goodsId }">--%>
<%--                        <img src="${list.mainPic }" class="proimg"/>--%>
<%--                        <p class="tit">${list.title }</p>--%>
<%--                        <p class="price">￥${list.actualPrice }<span>￥${list.originalPrice }</span><img src="images/f3.png" /></p>--%>
<%--                    </a>--%>
<%--                </li>--%>
<%--            </c:forEach>--%>
<%--        <li>--%>
<%--            <a href="xq.html">--%>
<%--                <img src="images/dp8.png" class="proimg"/>--%>
<%--                <p class="tit">韩国代购正品超爆款 休闲迷彩磨砂真皮运动鞋女单鞋</p>--%>
<%--                <p class="price">￥198.0<span>￥286.0</span><img src="images/f3.png" /></p>--%>
<%--            </a>--%>
<%--        </li>--%>
    </ul>
    <ul id="shoplikebox2">
    </ul>
    <ul id="shoplikebox3">
    </ul>
    <ul id="shoplikebox4">
    </ul>
    <ul id="shoplikebox5">
    </ul>
    <ul id="shoplikebox6">
    </ul>
    <ul id="shoplikebox7">
    </ul>
</div>
<div class="shoplist" style="display:none">
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

<%--        <c:forEach items="${requestScope.shop }" var="list">--%>
<%--            <li>--%>
<%--                <a href="xq.html">--%>
<%--                    <div class="listL"><img src="${list.mainPic }" /></div>--%>
<%--                    <div class="listR">--%>
<%--                        <div class="v1">${list.title}</div>--%>
<%--                        <div class="v2"><span>包邮</span></div>--%>
<%--                        <div class="v3">--%>
<%--                            <p class="p1">￥${list.actualPrice }<span>￥${list.originalPrice }</span></p>--%>
<%--                            <p class="p2">${list.dailySales }人付款</p>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </a>--%>
<%--            </li>--%>
<%--        </c:forEach>--%>
<%--        <li>--%>
<%--            <a href="xq.html">--%>
<%--                <div class="listL"><img src="images/dp4.png" /></div>--%>
<%--                <div class="listR">--%>
<%--                    <div class="v1">高贵塔夫绸抹胸长拖尾婚纱高贵塔夫绸抹胸长拖尾婚纱</div>--%>
<%--                    <div class="v2"><span>包邮</span></div>--%>
<%--                    <div class="v3">--%>
<%--                        <p class="p1">￥899<span>￥1600</span></p>--%>
<%--                        <p class="p2">364人付款</p>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </a>--%>
<%--        </li>--%>
<%--    </ul>--%>
</div>
<div class="sxbox">
    <div class="sxbox0">
        <div class="f_mask"></div>
        <div id="sxtj">
            <div class="sx_1">筛选</div>
            <div class="sx_2">
                <p class="tit">品牌</p>
                <a href="javascript:void()">名斓</a>
                <a href="javascript:void()">奥蒂莉亚</a>
                <a href="javascript:void()">GCU</a>
                <a href="javascript:void()">漫香农</a>
                <a href="javascript:void()">蒂满庭</a>
                <a href="javascript:void()">DearWhite</a>
            </div>
            <div class="sx_2">
                <p class="tit">类别</p>
                <a href="javascript:void()">婚纱</a>
            </div>
            <div class="sx_2">
                <p class="tit">折扣和服务</p>
                <a href="javascript:void()">包邮</a>
                <a href="javascript:void()">赠送运费险</a>
                <a href="javascript:void()">消费者保障</a>
                <a href="javascript:void()">全球购</a>
                <a href="javascript:void()">7天内退货</a>
                <a href="javascript:void()">通用排序</a>
            </div>
            <div class="sx_2">
                <p class="tit">价格区间</p>
                <div class="pric">
                    <input name="" type="text" /><label>-</label><input name="" type="text" />
                </div>
            </div>
            <div class="sx_3">
                <a href="javascript:void()">确定</a>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    var page =1;
    var ment = "default";
    var roll ="roll";
    var sort = "sort";
    window.onload = function(){
        reqpage(roll,ment);
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
            reqpage(roll,sort);

        }
    }
    function priceasc(){
        alert("升序");
    }
    function pricedes(){
        alert("降序");
    }
    //列表加载逻辑
    function reqpage(roll,sort) {
        if (page >= 7){
            var con ='';
            con +='<li>';
            con +=' <a>';
            con +='<p>已经到底了</p>';
            con +='</a>';
            con +='</li>';
            $("#shoplikebox7").html(con); //局部刷新
            $("#shoplistbox7").html(con);
        }else{
            switch (sort) {
                case "default":         //综合
                    if (roll ==""){
                        sort = "default";
                        scrollTo(0,0)
                        $("#shoplikebox2").html(""); //局部刷新
                        $("#shoplistbox2").html("");
                        $("#shoplikebox3").html(""); //局部刷新
                        $("#shoplistbox3").html("");
                        $("#shoplikebox4").html(""); //局部刷新
                        $("#shoplistbox4").html("");
                        $("#shoplikebox5").html(""); //局部刷新
                        $("#shoplistbox5").html("");
                        $("#shoplikebox6").html(""); //局部刷新
                        $("#shoplistbox6").html("");
                        var scrollTop = 0;
                        var windowHeight = 0;
                        page =1;            //初始化页码
                    }
                    sort = "default";
                    $("#comp").attr('class','on');
                    $("#sales").attr('class','off');
                    $("#price").attr('class','off');
                    break;
                case "total_sales_des": //销量
                    if (roll == ""){
                        sort = "total_sales_des";
                        scrollTo(0,0)
                        $("#shoplikebox2").html(""); //局部刷新
                        $("#shoplistbox2").html("");
                        $("#shoplikebox3").html(""); //局部刷新
                        $("#shoplistbox3").html("");
                        $("#shoplikebox4").html(""); //局部刷新
                        $("#shoplistbox4").html("");
                        $("#shoplikebox5").html(""); //局部刷新
                        $("#shoplistbox5").html("");
                        $("#shoplikebox6").html(""); //局部刷新
                        $("#shoplistbox6").html("");
                        var scrollTop = 0;
                        var windowHeight = 0;
                        page =1;            //初始化页码
                    }
                    sort = "total_sales_des";
                    $("#comp").attr('class','off');
                    $("#sales").attr('class','on');
                    $("#price").attr('class','off');
                    break;
                case "price_asc":       //价格_升序
                    if (roll == ""){
                        sort = "price_asc";
                        scrollTo(0,0)
                        $("#shoplikebox2").html(""); //局部刷新
                        $("#shoplistbox2").html("");
                        $("#shoplikebox3").html(""); //局部刷新
                        $("#shoplistbox3").html("");
                        $("#shoplikebox4").html(""); //局部刷新
                        $("#shoplistbox4").html("");
                        $("#shoplikebox5").html(""); //局部刷新
                        $("#shoplistbox5").html("");
                        $("#shoplikebox6").html(""); //局部刷新
                        $("#shoplistbox6").html("");
                        var scrollTop = 0;
                        var windowHeight = 0;
                        page =1;            //初始化页码
                    }
                    sort = "total_sales_des";
                    $("#comp").attr('class','off');
                    $("#sales").attr('class','off');
                    $("#price").attr('class','on');
                    break;
                case "price_des":       //价格_降序
                    if (roll == ""){
                        sort = "price_des";
                        scrollTo(0,0)
                        $("#shoplikebox2").html(""); //局部刷新
                        $("#shoplistbox2").html("");
                        $("#shoplikebox3").html(""); //局部刷新
                        $("#shoplistbox3").html("");
                        $("#shoplikebox4").html(""); //局部刷新
                        $("#shoplistbox4").html("");
                        $("#shoplikebox5").html(""); //局部刷新
                        $("#shoplistbox5").html("");
                        $("#shoplikebox6").html(""); //局部刷新
                        $("#shoplistbox6").html("");
                        var scrollTop = 0;
                        var windowHeight = 0;
                        page =1;            //初始化页码
                    }
                    sort = "total_sales_des";
                    $("#comp").attr('class','off');
                    $("#sales").attr('class','off');
                    $("#price").attr('class','on');
                    break;
                case "sort":
                    break;
            }
            $.ajax({
                type:"post",
                url:"${APP_PATH}/shoplist",
                data:{
                    wordName:"${wordName}",
                    pageId:page,
                    pageSize:70,
                    sort:sort              //排序
                },
                success:function(result){
                    if (result.success){
                        var content = '';
                        $.each(result.data,function (i,list) {
                            content+='<li>';
                            content+='    <a href="${APP_PATH}/item?id='+list.goodsId+'">';
                            content+='        <img src="'+list.mainPic+'" class="proimg"/>';
                            content+='        <p class="tit">'+list.title+'</p>';
                            content+='        <p class="price">￥'+list.actualPrice+'<span>￥'+list.originalPrice+'</span><span style="text-decoration:none;">日销量：'+list.dailySales+'</span><img src="images/f3.png" /></p>';
                            content+='    </a>';
                            content+='</li>';
                        });
                        var contentlist = '';
                        $.each(result.data,function (i,lists) {
                            contentlist+='<li>';
                            contentlist+='   <a href="${APP_PATH}/item?id='+lists.goodsId+'">';
                            contentlist+='       <div class="listL"><img src="'+lists.mainPic+'" /></div>';
                            contentlist+='       <div class="listR">';
                            contentlist+='           <div class="v1">'+lists.title+'</div>';
                            contentlist+='           <div class="v2"><span>包邮</span></div>';
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
                                $("#shoplikebox1").html(content); //局部刷新
                                $("#shoplistbox1").html(contentlist);
                                page = 1+1;
                                break;
                            case 2:
                                $("#shoplikebox2").html(content); //局部刷新
                                $("#shoplistbox2").html(contentlist);
                                page = 2+1;
                                break;
                            case 3:
                                $("#shoplikebox3").html(content); //局部刷新
                                $("#shoplistbox3").html(contentlist);
                                page = 3+1;
                                break;
                            case 4:
                                $("#shoplikebox4").html(content); //局部刷新
                                $("#shoplistbox4").html(contentlist);
                                page = 4+1;
                                break;
                            case 5:
                                $("#shoplikebox5").html(content); //局部刷新
                                $("#shoplistbox5").html(contentlist);
                                page = 5+1;
                                break;
                            case 6:
                                $("#shoplikebox6").html(content); //局部刷新
                                $("#shoplistbox6").html(contentlist);
                                aaa = 6+1;
                                break;
                        }

                    }
                }
            })
        }
    }
</script>
</body>
</html>
