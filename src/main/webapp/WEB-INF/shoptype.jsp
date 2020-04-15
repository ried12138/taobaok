<%--
  Created by IntelliJ IDEA.
  User: liuweiran
  Date: 2020/4/7
  Time: 10:54 上午
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
    <link type="text/css" rel="stylesheet" href="css/style.css" />
    <script type="text/javascript" src="js/jquery-1.8.1.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            var b=document.body.clientHeight;
            //alert(b);
            b=b-45.8;
            $('.shoptypebox').css('height',b);


            $(".shtypeLeft ul li").click(function () {
                $('.shtypeLeft ul li').removeClass('on');
                $(this).addClass('on');
            })
        })
    </script>
</head>

<body>
<div class="headerbox">
    <div class="header">
        <div class="headerL">
            <a href="${APP_PATH}/index" class="goback"><img src="images/goback.png" /></a>
        </div>
        <div class="headerC0">
            <div class="ssdiv">
                <input name="" type="text" placeholder="${sessionScope.hotword.get(19)}"/>
                <a href="javascript:history.back(-1)"><img src="images/ss.png" /></a>
            </div>
        </div>
        <div class="headerR">
            <a href="${APP_PATH}/index">取消</a>
        </div>
    </div>
</div>
<div class="clear"></div>
<div class="hbox"></div>
<div class="shoptypebox">
    <!-- 一级分类 -->
    <div class="shtypeLeft">
        <ul>
            <c:forEach items="${shoptype}" var="list">
                <li><a href="#m${list.cid}">${list.cname}</a></li>
            </c:forEach>
        </ul>
    </div>
    <div class="shtypeRight">
        <div class="boxOne">
            <!--广告位，待用 -->
<%--            <div class="box1">--%>
<%--                <img src="images/1.jpg" />--%>
<%--            </div>--%>
            <!-- 二级分类 -->
        <c:forEach items="${shoptype}" var="list">
            <c:if test="${list.cid == 1}" >
            <a name="m${list.cid}">
                <div class="box2">
                    <p>${list.cname}</p>
                </div>
            </a>
            <div class="box3">
                <ul>
                    <c:set value="${list.subcategories}" var="womenwears"/>
                    <c:forEach items="${womenwears}" var="womenwear">
                        <li>
                            <a class="towlevel" id="${womenwear.subcname}">
                                <img src="${womenwear.scpic}" />
                                <p>${womenwear.subcname}</p>
                            </a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
            </c:if>
            <c:if test="${list.cid == 2}">
            <a name="m${list.cid}">
                <div class="box2">
                    <p>${list.cname}</p>
                </div>
            </a>
            <div class="box3">
                <ul>
                    <c:forEach items="${list.subcategories}" var="motherbabys">
                    <li>
                        <a class="towlevel" id="${motherbabys.subcname}">
                            <img src="${motherbabys.scpic}" />
                            <p>${motherbabys.subcname}</p>
                        </a>
                    </li>
                    </c:forEach>
                </ul>
            </div>
            </c:if>
            <c:if test="${list.cid == 3}">
            <a name="m${list.cid}">
                <div class="box2">
                    <p>${list.cname}</p>
                </div>
            </a>
            <div class="box3">
                <ul>
                    <c:forEach items="${list.subcategories}" var="makeup">
                        <li>
                            <a class="towlevel" id="${makeup.subcname}">
                                <img src="${makeup.scpic}" />
                                <p>${makeup.subcname}</p>
                            </a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
            </c:if>

            <c:if test="${list.cid == 4}">
            <a name="m${list.cid}">
                <div class="box2">
                    <p>${list.cname}</p>
                </div>
            </a>
            <div class="box3">
                <ul>
                    <c:forEach items="${list.subcategories}" var="homedaily">
                    <li>
                        <a class="towlevel" id="${homedaily.subcname}">
                            <img src="${homedaily.scpic}" />
                            <p>${homedaily.subcname}</p>
                        </a>
                    </li>
                    </c:forEach>
                </ul>
            </div>
            </c:if>

            <c:if test="${list.cid == 5}">
            <a name="m${list.cid}">
                <div class="box2">
                    <p>${list.cname}</p>
                </div>
            </a>
            <div class="box3">
                <ul>
                    <c:forEach items="${list.subcategories}" var="shoes">
                    <li>
                        <a class="towlevel" id="${shoes.subcname}">
                            <img src="${shoes.scpic}" />
                            <p>${shoes.subcname}</p>
                        </a>
                    </li>
                    </c:forEach>
                </ul>
            </div>
            </c:if>

            <c:if test="${list.cid == 6}">
            <a name="m${list.cid}">
                <div class="box2">
                    <p>${list.cname}</p>
                </div>
            </a>
            <div class="box3">
                <ul>
                    <c:forEach items="${list.subcategories}" var="food">
                        <li>
                            <a class="towlevel" id="${food.subcname}">
                                <img src="${food.scpic}" />
                                <p>${food.subcname}</p>
                            </a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
            </c:if>

            <c:if test="${list.cid == 7}">
            <a name="m${list.cid}">
                <div class="box2">
                    <p>${list.cname}</p>
                </div>
            </a>
            <div class="box3">
                <ul>
                    <c:forEach items="${list.subcategories}" var="Culturalandcarperiphery">
                    <li>
                        <a class="towlevel" id="${Culturalandcarperiphery.subcname}">
                            <img src="${Culturalandcarperiphery.scpic}" />
                            <p>${Culturalandcarperiphery.subcname}</p>
                        </a>
                    </li>
                    </c:forEach>
                </ul>
            </div>
            </c:if>

            <c:if test="${list.cid == 8}">
            <a name="m${list.cid}">
                <div class="box2">
                    <p>${list.cname}</p>
                </div>
            </a>
            <div class="box3">
                <ul>
                    <c:forEach items="${list.subcategories}" var="digital">
                    <li>
                        <a class="towlevel" id="${digital.subcname}">
                            <img src="${digital.scpic}" />
                            <p>${digital.subcname}</p>
                        </a>
                    </li>
                    </c:forEach>
                </ul>
            </div>
            </c:if>
            <c:if test="${list.cid == 9}">
                <a name="${list.cid}">
                    <div class="box2">
                        <p>${list.cname}</p>
                    </div>
                </a>
                <div class="box3">
                    <ul>
                        <c:forEach items="${list.subcategories}" var="Mens">
                            <li>
                                <a class="towlevel" id="${Mens.subcname}">
                                    <img src="${Mens.scpic}" />
                                    <p>${Mens.subcname}</p>
                                </a>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </c:if>
            <c:if test="${list.cid == 10}">
                <a name="m${list.cid}">
                    <div class="box2">
                        <p>${list.cname}</p>
                    </div>
                </a>
                <div class="box3">
                    <ul>
                        <c:forEach items="${list.subcategories}" var="Underwear">
                            <li>
                                <a class="towlevel" id="${Underwear.subcname}">
                                    <img src="${Underwear.scpic}" />
                                    <p>${Underwear.subcname}</p>
                                </a>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </c:if>
            <c:if test="${list.cid == 11}">
                <a name="m${list.cid}">
                    <div class="box2">
                        <p>${list.cname}</p>
                    </div>
                </a>
                <div class="box3">
                    <ul>
                        <c:forEach items="${list.subcategories}" var="luggageandbags">
                            <li>
                                <a class="towlevel" id="${luggageandbags.subcname}">
                                    <img src="${luggageandbags.scpic}" />
                                    <p>${luggageandbags.subcname}</p>
                                </a>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </c:if>
            <c:if test="${list.cid == 12}">
                <a name="m${list.cid}">
                    <div class="box2">
                        <p>${list.cname}</p>
                    </div>
                </a>
                <div class="box3">
                    <ul>
                        <c:forEach items="${list.subcategories}" var="jewelry">
                            <li>
                                <a class="towlevel" id="${jewelry.subcname}">
                                    <img src="${jewelry.scpic}" />
                                    <p>${jewelry.subcname}</p>
                                </a>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </c:if>
            <c:if test="${list.cid == 13}">
                <a name="m${list.cid}">
                    <div class="box2">
                        <p>${list.cname}</p>
                    </div>
                </a>
                <div class="box3">
                    <ul>
                        <c:forEach items="${list.subcategories}" var="sport">
                            <li>
                                <a class="towlevel" id="${sport.subcname}">
                                    <img src="${sport.scpic}" />
                                    <p>${sport.subcname}</p>
                                </a>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </c:if>
            <c:if test="${list.cid == 14}">
                <a name="m${list.cid}">
                    <div class="box2">
                        <p>${list.cname}</p>
                    </div>
                </a>
                <div class="box3">
                    <ul>
                        <c:forEach items="${list.subcategories}" var="hometextile">
                            <li>
                                <a class="towlevel" id="${hometextile.subcname}">
                                    <img src="${hometextile.scpic}" />
                                    <p>${hometextile.subcname}</p>
                                </a>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </c:if>
        </c:forEach>
        </div>
    </div>
    <div class="clear"></div>
</div>
<script type="text/javascript">
    //获取一级分类id执行跳转
    $(".towlevel").each(function(){
        $(this).click(function(){
            var name = $(this).attr("id");
            todu(name);
        });
    });
    function todu(name) {
        window.location.href="${APP_PATH }/shoplists?wordName="+name;
    }
</script>
<jsp:include page="zhanzhangtongji.jsp"/>
</body>
</html>
