<%--
  Created by IntelliJ IDEA.
  User: liuweiran
  Date: 2020/3/24
  Time: 7:53 下午
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
<%--    <script>/*@cc_on window.location.href="http://support.dmeng.net/upgrade-your-browser.html?referrer="+encodeURIComponent(window.location.href); @*/</script>--%>
    <title>搜索页</title>
    <link type="text/css" rel="stylesheet" href="css/style.css" />
</head>

<body style="background:#fff">
<div class="headerbox">
    <div class="header">
        <div class="headerL">
            <a onclick="javascript:history.back(-1)" class="goback"><img src="images/goback.png" /></a>
        </div>
        <div class="headerC0">
            <div class="ssdiv">
                <input id="search" name="search" type="text" placeholder="进口生鲜今日三折起售" />
                <a onclick="todo()"><img src="images/ss.png" /></a>
<%--                <a href="shoplist.html"><img src="images/ss.png" /></a>--%>
            </div>
        </div>
        <div class="headerR">
            <a href="${APP_PATH }/index">取消</a>
        </div>
    </div>
</div>
<div class="clear"></div>
<div class="hbox"></div>
<div class="zjssbox">
    <img src="images/s.png" class="i1"/>
    <p class="sstxt">最近搜索</p>
    <img src="images/del.png" class="i2"/>
</div>
<div class="clear"></div>
<div class="ssbox">
<%--    <a href="shoplist.html">羽绒服</a><a href="shoplist.html">毛呢外套</a><a href="shoplist.html">水杯</a><a href="shoplist.html">打底裤</a><a href="shoplist.html">茶壶</a><a href="shoplist.html">面膜</a><a href="shoplist.html">保温杯</a><a href="shoplist.html">宽松毛衣女</a><a href="shoplist.html">剃须刀</a><a href="shoplist.html">核桃夹子</a>--%>
</div>
<div class="clear"></div>
<div class="linebox">
    <div class="line0"></div>
</div>
<div class="zjssbox">
    <img src="images/huo.png" class="i1"/>
    <p class="sstxt">热门搜索</p>
</div>
<div class="clear"></div>
<div class="ssbox">
    <c:if test="${not empty list }">
        <c:forEach items="${list}" var='hotList'>
            <a class="iclist" id="${hotList.toString()}">${hotList.toString()}</a>
        </c:forEach>
    </c:if>
    <c:if test="${empty list}">
    </c:if>
<%--    <a href="shoplist.html"></a><a href="shoplist.html">毛呢外套</a><a href="shoplist.html">水杯</a><a href="shoplist.html">打底裤</a><a href="shoplist.html">茶壶</a><a href="shoplist.html">面膜</a><a href="shoplist.html">保温杯</a><a href="shoplist.html">宽松毛衣女</a><a href="shoplist.html">剃须刀</a><a href="shoplist.html">核桃夹子</a>--%>

</div>
<script src="js/jquery-1.8.1.min.js"></script>
<script>
    $(".iclist").each(function(){
        $(this).click(function(){
            var id = $(this).attr("id");
            todo(id);
        });
    });
    //同步请求，到搜索结果页
    function todo(id){
        var placeholder = $("#search").attr('placeholder');         //默认词
        var search = $("#search").val();                              //搜索词
        var hotword = id;          //热搜词
        $.ajax({
            type:"post",
            url:"${APP_PATH }/Word",
            async:false,
            data:{
                placeholder:placeholder,
                search:search,
                hotword:hotword
            },
            success:function(result){
                if (result.success){
                    window.location.href="${APP_PATH }/shoplist?wordName="+result.data;
                }
            }
        })
    }
</script>
</body>
</html>

