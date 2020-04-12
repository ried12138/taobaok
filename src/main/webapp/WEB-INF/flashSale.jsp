<%--
  Created by IntelliJ IDEA.
  User: liuweiran
  Date: 2020/4/11
  Time: 10:51 下午
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
<header class="person_top">
    <ul class="tab-head">
    <li ><a onclick="javascript:history.back(-1)" class="goback"><img src="../images/goback.png" /></a></li>
    <li class="tab-head-item">${dateTime}的场次</li>
    </ul>
</header>

<div class="totop"><a href="javascript:scrollTo(0,0)"><img src="images/totop.png" /></a></div>
<div class="kbox"></div>
<div class="shoplist">
    <ul id="shoplistbox1">
        <c:if test="${not empty flashSale}">
            <c:forEach items="${flashSale}" var="lists">
                <li>
                    <a href="${APP_PATH}/item?id=${lists.goodsId}">
                        <div class="listL"><img src="${lists.mainPic}" /></div>
                        <div class="listR">
                            <div class="v1">${lists.title}</div>
                            <div class="v3">
                                <p class="p1">￥${lists.actualPrice}<span>￥${lists.originalPrice}</span></p>
                                <p class="p2">${lists.dailySales}人付款</p>
                            </div>
                        </div>
                    </a>
                </li>
            </c:forEach>
        </c:if>
    </ul>
</div>

</body>
</html>
