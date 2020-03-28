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
            <a id="word" href="seacher.html" style="display:block; width:100%; height:100%" >${requestScope.wordName}</a>
        </div>
        <div class="headerR">
            <a href="${APP_PATH }/search">取消</a>
        </div>
    </div>
</div>
<div class="clear"></div>
<div class="shopType">
    <ul>
        <li class="on">
            <a href="shoplist.html">综合</a>
        </li>
        <li>
            <a href="shoplist.html">销量</a>
        </li>
        <li>
            <a href="shoplist.html">价格</a>
            <span class="pricebtn1"></span>
            <span class="pricebtn2"></span>
        </li>
        <li>
            <a href="dplist.html">店铺</a>
        </li>
        <li>
            <a href="javascript:void()" class="a_sx">筛选</a>
        </li>
    </ul>
</div>
<div class="clear"></div>
<div class="hbox1"></div>
<div class="tolist"><img src="images/tolist.png" /></div>
<div class="totop"><a href="javascript:scrollTo(0,0)"><img src="images/totop.png" /></a></div>
<div class="kbox"></div>
<div class="likebox">

    <ul id="shoplikebox">
<%--        <c:if test="${not empty shop}">--%>
            <c:forEach items="${requestScope.shop }" var="list">
                <li>
                    <a href="${APP_PATH}/item?id=${list.goodsId }">
                        <img src="${list.mainPic }" class="proimg"/>
                        <p class="tit">${list.title }</p>
                        <p class="price">￥${list.actualPrice }<span>￥${list.originalPrice }</span><img src="images/f3.png" /></p>
                    </a>
                </li>
            </c:forEach>
<%--        </c:if>--%>
<%--        <li>--%>
<%--            <a href="xq.html">--%>
<%--                <img src="images/dp8.png" class="proimg"/>--%>
<%--                <p class="tit">韩国代购正品超爆款 休闲迷彩磨砂真皮运动鞋女单鞋</p>--%>
<%--                <p class="price">￥198.0<span>￥286.0</span><img src="images/f3.png" /></p>--%>
<%--            </a>--%>
<%--        </li>--%>
    </ul>
</div>
<div class="shoplist" style="display:none">
    <ul>
        <c:forEach items="${requestScope.shop }" var="list">
            <li>
                <a href="xq.html">
                    <div class="listL"><img src="${list.mainPic }" /></div>
                    <div class="listR">
                        <div class="v1">${list.title}</div>
                        <div class="v2"><span>包邮</span></div>
                        <div class="v3">
                            <p class="p1">￥${list.actualPrice }<span>￥${list.originalPrice }</span></p>
                            <p class="p2">${list.dailySales }人付款</p>
                        </div>
                    </div>
                </a>
            </li>
        </c:forEach>
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
    </ul>
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

</script>
</body>
</html>
