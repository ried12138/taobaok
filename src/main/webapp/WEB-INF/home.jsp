<%--
  Created by IntelliJ IDEA.
  User: liuweiran
  Date: 2020/3/23
  Time: 7:49 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=0">
    <meta name="renderer" content="webkit"/>
    <meta name="force-rendering" content="webkit"/>
    <script>/*@cc_on window.location.href="http://support.dmeng.net/upgrade-your-browser.html?referrer="+encodeURIComponent(window.location.href); @*/</script>
    <title>涿鹿领券分享网</title>
    <link type="text/css" rel="stylesheet" href="../css/style.css" />
    <script type="text/javascript" src="../js/jquery-1.8.1.min.js"></script>
    <script type="text/javascript" src="../js/banner.js"></script>
</head>
<body>
<body>
<div class="topssbox1">
    <div class="topss">
        <a href="${pageContext.request.contextPath }/search">
            <div class="topssbox">
                <img src="../images/s.png" />
            </div>
        </a>
    </div>
</div>
<div class="banner">
    <div id="fade_focus">
        <div class="loading"></div>
        <ul>
            <li><img src="../images/banner.jpg"/></li>
            <li><img src="../images/banner.jpg"/></li>
            <li><img src="../images/banner.jpg"/></li>
            <li><img src="../images/banner.jpg"/></li>
        </ul>
    </div>
</div>
<div class="clear"></div>
<div class="typeNav">
    <ul>
        <li>
            <!-- 跳转请求-->
            <a href="${pageContext.request.contextPath }/item">
                <img src="../images/typeicon1.png" />
                <p>今日特惠</p>
            </a>
        </li>
        <li>
            <a href="shoplist.html">
                <img src="../images/typeicon2.png" />
                <p>全球购</p>
            </a>
        </li>
        <li>
            <a href="javascript:void()">
                <img src="../images/typeicon3.png" />
                <p>充值中心</p>
            </a>
        </li>
        <li>
            <a href="jifen.html">
                <img src="../images/typeicon4.png" />
                <p>我的积分</p>
            </a>
        </li>
        <li>
            <a href="javascript:void()">
                <img src="../images/typeicon5.png" />
                <p>签到</p>
            </a>
        </li>
        <li>
            <a href="quanNews1.html">
                <img src="../images/typeicon6.png" />
                <p>优惠券</p>
            </a>
        </li>
        <li>
            <a href="shoplist.html">
                <img src="../images/typeicon7.png" />
                <p>闪电购</p>
            </a>
        </li>
        <li>
            <a href="shopType.html">
                <img src="../images/typeicon8.png" />
                <p>分类</p>
            </a>
        </li>
    </ul>
</div>
<div class="clear"></div>
<div class="hotTit">
    <div class="hotTitL">
        <img src="../images/hotit.png" />
    </div>
    <div class="hotTitR">
        <p>商城开业狂欢！四重大礼等你来抢！</p>
    </div>
</div>
<div class="clear"></div>
<div class="kbox"></div>
<div class="timeBuy">
    <div class="Buybox">
        <p><span>限时</span>抢购</p>
        <a href="shoplist.html" class="more"></a>
        <a href="shoplist.html" class="btn">全场一折起</a>
    </div>
    <ul>
        <li>
            <a href="xq.html">
                <img src="../images/timebuy1.png" />
                <p>超值特惠电饭煲</p>
            </a>
        </li>
        <li>
            <a href="xq.html">
                <img src="../images/timebuy2.png" />
                <p>达芙妮秋款包包</p>
            </a>
        </li>
        <li>
            <a href="xq.html">
                <img src="../images/timebuy3.png" />
                <p>特百惠优质水杯</p>
            </a>
        </li>
        <li>
            <a href="xq.html">
                <img src="../images/timebuy4.png" />
                <p>易捷手机充电宝</p>
            </a>
        </li>
    </ul>
    <div class="clear"></div>
</div>
<div class="clear"></div>
<div class="kbox"></div>
<div class="clear"></div>
<div class="w100">
    <img src="../images/ad.jpg" />
</div>
<div class="clear"></div>
<div class="kbox"></div>
<div class="clear"></div>
<div class="hotMarket">
    <div class="hotM_1">
        <div class="hotM_1L">
            <div style="width:100%; height:100%;background-image:url(../images/1.png); background-repeat:no-repeat; background-position:center center; background-size:contain"></div>
        </div>
        <div class="hotM_1C">
            <div style="width:100%; height:100%;background-image:url(../images/2.png); background-repeat:no-repeat; background-position:center center; background-size:contain"></div>
        </div>
        <div class="hotM_1R">
            <div style="width:100%; height:100%;background-image:url(../images/3.png); background-repeat:no-repeat; background-position:center center; background-size:contain"></div>
        </div>
    </div>
    <div class="hotM_1">
        <div class="hotM_1L">
            <div style="width:100%; height:100%;background-image:url(../images/4.png); background-repeat:no-repeat; background-position:center center; background-size:contain"></div>
        </div>
        <div class="hotM_1C">
            <div style="width:100%; height:100%;background-image:url(../images/5.png); background-repeat:no-repeat; background-position:center center; background-size:contain"></div>
        </div>
        <div class="hotM_1R">
            <div style="width:100%; height:100%;background-image:url(../images/6.png); background-repeat:no-repeat; background-position:center center; background-size:contain"></div>
        </div>
    </div>
</div>
<div class="clear"></div>
<div class="kbox"></div>
<div class="hotMarket">
    <div class="hotM_2">
        <p><span>品牌</span>特卖</p>
        <i>知名品牌，特价销售</i>
        <a href="shoplist.html" class="more">更多</a>
    </div>
    <div class="hotM_3">
        <div class="hotM_3L">
            <div style="width:100%; height:100%;background-image:url(../images/7.png); background-repeat:no-repeat; background-position:center center; background-size:contain"></div>
        </div>
        <div class="hotM_3R">
            <div class="hotM_3R_1">
                <div style="width:100%; height:100%;background-image:url(../images/8.png); background-repeat:no-repeat; background-position:center center; background-size:contain"></div>
            </div>
            <div class="hotM_3R_1 br">
                <div style="width:100%; height:100%;background-image:url(../images/9.png); background-repeat:no-repeat; background-position:center center; background-size:contain"></div>
            </div>
            <div class="hotM_3R_1">
                <div style="width:100%; height:100%;background-image:url(../images/10.png); background-repeat:no-repeat; background-position:center center; background-size:contain"></div>
            </div>
            <div class="hotM_3R_1 br">
                <div style="width:100%; height:100%;background-image:url(../images/11.png); background-repeat:no-repeat; background-position:center center; background-size:contain"></div>
            </div>
        </div>
    </div>
</div>
<div class="clear"></div>
<div class="kbox"></div>
<div class="hotMarket">
    <div class="hotM_2">
        <p><span>热门</span>主题</p>
        <i>太热门啦，要挤爆了</i>
        <a href="shoplist.html" class="more">更多</a>
    </div>
    <div class="hotM_4">
        <div class="hotM_4L">
            <div style="width:100%; height:100%;background-image:url(../images/12.png); background-repeat:no-repeat; background-position:center center; background-size:contain"></div>
        </div>
        <div class="hotM_4R">
            <div class="hotM_4R_1">
                <div style="width:100%; height:100%;background-image:url(../images/13.png); background-repeat:no-repeat; background-position:center center; background-size:contain"></div>
            </div>
            <div class="hotM_4R_1 br">
                <div style="width:100%; height:100%;background-image:url(../images/14.png); background-repeat:no-repeat; background-position:center center; background-size:contain"></div>
            </div>
            <div class="hotM_4R_1">
                <div style="width:100%; height:100%;background-image:url(../images/15.png); background-repeat:no-repeat; background-position:center center; background-size:contain"></div>
            </div>
            <div class="hotM_4R_1 br">
                <div style="width:100%; height:100%;background-image:url(../images/16.png); background-repeat:no-repeat; background-position:center center; background-size:contain"></div>
            </div>
        </div>
    </div>
    <div class="hotM_5">
        <div class="hotM_5L">
            <div style="width:100%; height:100%;background-image:url(../images/17.png); background-repeat:no-repeat; background-position:center center; background-size:contain"></div>
        </div>
        <div class="hotM_5L">
            <div style="width:100%; height:100%;background-image:url(../images/18.png); background-repeat:no-repeat; background-position:center center; background-size:contain"></div>
        </div>
        <div class="hotM_5L">
            <div style="width:100%; height:100%;background-image:url(../images/19.png); background-repeat:no-repeat; background-position:center center; background-size:contain"></div>
        </div>
        <div class="hotM_5L br">
            <div style="width:100%; height:100%;background-image:url(../images/20.png); background-repeat:no-repeat; background-position:center center; background-size:contain"></div>
        </div>
    </div>
</div>
<div class="clear"></div>
<div class="kbox"></div>
<div class="likebox">
    <div class="likeTit">
        <img src="../images/heart.png" /><span>猜你喜欢</span>
    </div>
    <ul>
        <li>
            <a href="xq.html">
                <img src="../images/21.png" class="proimg"/>
                <p class="tit">三利 毛巾家纺纯棉吸水 提缎面巾两条装</p>
                <p class="price">￥29.9<span>￥49.9</span><img src="../images/f3.png" /></p>
            </a>
        </li>
        <li>
            <a href="xq.html">
                <img src="../images/22.png" class="proimg"/>
                <p class="tit">韩国代购正品超爆款 </p>
                <p class="price">￥198.0<span>￥286.0</span><img src="../images/f3.png" /></p>
            </a>
        </li>
        <li>
            <a href="xq.html">
                <img src="../images/23.png" class="proimg"/>
                <p class="tit">三利 毛巾家纺纯棉吸水 提缎面巾两条装</p>
                <p class="price">￥29.9<span>￥49.9</span><img src="../images/f3.png" /></p>
            </a>
        </li>
        <li>
            <a href="xq.html">
                <img src="../images/24.png" class="proimg"/>
                <p class="tit">韩国代购正品超爆款 休闲迷彩磨砂真皮运动鞋女单鞋</p>
                <p class="price">￥198.0<span>￥286.0</span><img src="../images/f3.png" /></p>
            </a>
        </li>
        <li>
            <a href="xq.html">
                <img src="../images/25.png" class="proimg"/>
                <p class="tit">三利 毛巾家纺纯棉吸水 提缎面巾两条装</p>
                <p class="price">￥29.9<span>￥49.9</span><img src="../images/f3.png" /></p>
            </a>
        </li>
        <li>
            <a href="xq.html">
                <img src="../images/26.png" class="proimg"/>
                <p class="tit">韩国代购正品超爆款 休闲迷彩磨砂真皮运动鞋女单鞋</p>
                <p class="price">￥198.0<span>￥286.0</span><img src="../images/f3.png" /></p>
            </a>
        </li>
        <li>
            <a href="xq.html">
                <img src="../images/27.png" class="proimg"/>
                <p class="tit">三利 毛巾家纺纯棉吸水 提缎面巾两条装</p>
                <p class="price">￥29.9<span>￥49.9</span><img src="../images/f3.png" /></p>
            </a>
        </li>
        <li>
            <a href="xq.html">
                <img src="../images/28.png" class="proimg"/>
                <p class="tit">韩国代购正品超爆款 休闲迷彩磨砂真皮运动鞋女单鞋</p>
                <p class="price">￥198.0<span>￥286.0</span><img src="../images/f3.png" /></p>
            </a>
        </li>
    </ul>
</div>
<div class="fbox"></div>
<div class="footbox">
    <div class="footer">
        <ul>
            <li class="on">
                <a href="index.html">
                    <img src="../images/f1.png" />
                    <p>首页</p>
                </a>
            </li>
            <li>
                <a href="message.html">
                    <img src="../images/f02.png" />
                    <p>发现</p>
                </a>
            </li>
            <li>
                <a href="gwc.html">
                    <img src="../images/f03.png" />
                    <p>购物车</p>
                </a>
            </li>
            <li>
                <a href="my.html">
                    <img src="../images/f04.png" />
                    <p>我的</p>
                </a>
            </li>
        </ul>
    </div>
</div>
</body>
</body>
</html>
