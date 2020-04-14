<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
    <title>涿鹿领券分享</title>
    <link type="text/css" rel="stylesheet" href="../../css/style.css" />
    <script type="text/javascript" src="${APP_PATH }/js/jquery-1.8.1.min.js"> </script>
    <script type="text/javascript" src="${APP_PATH }/js/banner.js"> </script>
</head>
<body>
<body>
<div class="topssbox1">
    <div class="topss">
        <a href="${APP_PATH }/search">
            <div class="topssbox">
                <img src="../../images/s.png" />
            </div>
        </a>
    </div>
</div>

<div class="banner">
    <div id="fade_focus">
        <div class="loading"></div>
        <ul id="bannerid">
            <c:forEach items="${topicBean}" var="list">
                <c:if test="${not empty list.activityLink}" >
                    <li>
                        <a href="${list.activityLink}">
                            <img src="${list.materialLink}" />
                        </a>
                    </li>
                </c:if>
            </c:forEach>
<%--            <li><img src="../../images/banner.jpg"/></li>--%>
        </ul>
    </div>
</div>
<div class="clear"></div>
<div class="typeNav">
    <ul>
        <%--        <li>--%>
        <%--            <!-- 跳转请求-->--%>
        <%--            <a href="${pageContext.request.contextPath }/item">--%>
        <%--                <img src="../../images/typeicon1.png" />--%>
        <%--                <p>今日特惠</p>--%>
        <%--            </a>--%>
        <%--        </li>--%>
        <%--        <li>--%>
        <%--            <a href="shoplist.html">--%>
        <%--                <img src="../../images/typeicon2.png" />--%>
        <%--                <p>全球购</p>--%>
        <%--            </a>--%>
        <%--        </li>--%>
        <li>
            <a href="${APP_PATH}/user/register">
                <img src="../../images/typeicon5.png" />
                <p>签到</p>
            </a>
        </li>
        <li>
            <a href="${APP_PATH}/jiukuaijiulist">
                <img src="../../images/typeicon9.png" />
                <p>9块9包邮</p>
            </a>
        </li>
        <li>
            <a href="${APP_PATH}/hotcatalogue">
                <img src="../../images/typeicon6.png" />
                <p>活动热卖</p>
            </a>
        </li>
        <li>
            <a href="javascript:scoreshop()">
                <img src="../../images/typeicon4.png" />
                <p>鹿豆商城</p>
            </a>
        </li>


        <%--        <li>--%>
        <%--            <a href="shoplist.html">--%>
        <%--                <img src="../../images/typeicon7.png" />--%>
        <%--                <p>闪电购</p>--%>
        <%--            </a>--%>
        <%--        </li>--%>
        <%--        <li>--%>
        <%--            <a href="shopType.html">--%>
        <%--                <img src="../../images/typeicon8.png" />--%>
        <%--                <p>分类</p>--%>
        <%--            </a>--%>
        <%--        </li>--%>
    </ul>
</div>
<%--<div class="clear"></div>--%>
<%--<div class="hotTit">--%>
<%--    <div class="hotTitL">--%>
<%--        <img src="../../images/hotit.png" />--%>
<%--    </div>--%>
<%--    <div class="hotTitR">--%>
<%--        <p>商城开业狂欢！四重大礼等你来抢！</p>--%>
<%--    </div>--%>
<%--</div>--%>
<%--<div class="clear"></div>--%>
<%--<div class="kbox"></div>--%>
<div class="timeBuy">
    <div class="Buybox">
        <p><span>限时</span>抢购</p>
        <a href="${APP_PATH}/flashSale" class="more"></a>
        <a href="${APP_PATH}/flashSale" class="btn">${dateTime}场</a>
    </div>
    <ul>
        <li>
            <a href="${APP_PATH}/flashSale">
                <img src="${flashSale.get(0).mainPic}" />
                <p>${flashSale.get(0).ddqDesc}</p>
            </a>
        </li>
        <li>
            <a href="${APP_PATH}/flashSale">
                <img src="${flashSale.get(1).mainPic}" />
                <p>${flashSale.get(1).ddqDesc}</p>
            </a>
        </li>
        <li>
            <a href="${APP_PATH}/flashSale">
                <img src="${flashSale.get(2).mainPic}" />
                <p>${flashSale.get(2).ddqDesc}</p>
            </a>
        </li>
        <li>
            <a href="${APP_PATH}/flashSale">
                <img src="${flashSale.get(3).mainPic}" />
                <p>${flashSale.get(3).ddqDesc}</p>
            </a>
        </li>
    </ul>
    <div class="clear"></div>
</div>
<%--<div class="clear"></div>--%>
<%--<div class="kbox"></div>--%>
<%--<div class="clear"></div>--%>
<%--<div class="w100">--%>
<%--    <img src="../../images/ad.jpg" />--%>
<%--</div>--%>
<%--<div class="clear"></div>--%>
<%--<div class="kbox"></div>--%>
<%--<div class="clear"></div>--%>
<%--<div class="hotMarket">--%>
<%--    <div class="hotM_1">--%>
<%--        <div class="hotM_1L">--%>
<%--            <div style="width:100%; height:100%;background-image:url(../../images/1.png); background-repeat:no-repeat; background-position:center center; background-size:contain"></div>--%>
<%--        </div>--%>
<%--        <div class="hotM_1C">--%>
<%--            <div style="width:100%; height:100%;background-image:url(../../images/2.png); background-repeat:no-repeat; background-position:center center; background-size:contain"></div>--%>
<%--        </div>--%>
<%--        <div class="hotM_1R">--%>
<%--            <div style="width:100%; height:100%;background-image:url(../../images/3.png); background-repeat:no-repeat; background-position:center center; background-size:contain"></div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--    <div class="hotM_1">--%>
<%--        <div class="hotM_1L">--%>
<%--            <div style="width:100%; height:100%;background-image:url(../../images/4.png); background-repeat:no-repeat; background-position:center center; background-size:contain"></div>--%>
<%--        </div>--%>
<%--        <div class="hotM_1C">--%>
<%--            <div style="width:100%; height:100%;background-image:url(../../images/5.png); background-repeat:no-repeat; background-position:center center; background-size:contain"></div>--%>
<%--        </div>--%>
<%--        <div class="hotM_1R">--%>
<%--            <div style="width:100%; height:100%;background-image:url(../../images/6.png); background-repeat:no-repeat; background-position:center center; background-size:contain"></div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<%--<div class="clear"></div>--%>
<%--<div class="kbox"></div>--%>
<%--<div class="hotMarket">--%>
<%--    <div class="hotM_2">--%>
<%--        <p><span>品牌</span>特卖</p>--%>
<%--        <i>知名品牌，特价销售</i>--%>
<%--        <a href="shoplist.html" class="more">更多</a>--%>
<%--    </div>--%>
<%--    <div class="hotM_3">--%>
<%--        <div class="hotM_3L">--%>
<%--            <div style="width:100%; height:100%;background-image:url(../../images/7.png); background-repeat:no-repeat; background-position:center center; background-size:contain"></div>--%>
<%--        </div>--%>
<%--        <div class="hotM_3R">--%>
<%--            <div class="hotM_3R_1">--%>
<%--                <div style="width:100%; height:100%;background-image:url(../../images/8.png); background-repeat:no-repeat; background-position:center center; background-size:contain"></div>--%>
<%--            </div>--%>
<%--            <div class="hotM_3R_1 br">--%>
<%--                <div style="width:100%; height:100%;background-image:url(../../images/9.png); background-repeat:no-repeat; background-position:center center; background-size:contain"></div>--%>
<%--            </div>--%>
<%--            <div class="hotM_3R_1">--%>
<%--                <div style="width:100%; height:100%;background-image:url(../../images/10.png); background-repeat:no-repeat; background-position:center center; background-size:contain"></div>--%>
<%--            </div>--%>
<%--            <div class="hotM_3R_1 br">--%>
<%--                <div style="width:100%; height:100%;background-image:url(../../images/11.png); background-repeat:no-repeat; background-position:center center; background-size:contain"></div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<%--<div class="clear"></div>--%>
<%--<div class="kbox"></div>--%>
<%--<div class="hotMarket">--%>
<%--    <div class="hotM_2">--%>
<%--        <p><span>热门</span>主题</p>--%>
<%--        <i>太热门啦，要挤爆了</i>--%>
<%--        <a href="shoplist.html" class="more">更多</a>--%>
<%--    </div>--%>
<%--    <div class="hotM_4">--%>
<%--        <div class="hotM_4L">--%>
<%--            <div style="width:100%; height:100%;background-image:url(../../images/12.png); background-repeat:no-repeat; background-position:center center; background-size:contain"></div>--%>
<%--        </div>--%>
<%--        <div class="hotM_4R">--%>
<%--            <div class="hotM_4R_1">--%>
<%--                <div style="width:100%; height:100%;background-image:url(../../images/13.png); background-repeat:no-repeat; background-position:center center; background-size:contain"></div>--%>
<%--            </div>--%>
<%--            <div class="hotM_4R_1 br">--%>
<%--                <div style="width:100%; height:100%;background-image:url(../../images/14.png); background-repeat:no-repeat; background-position:center center; background-size:contain"></div>--%>
<%--            </div>--%>
<%--            <div class="hotM_4R_1">--%>
<%--                <div style="width:100%; height:100%;background-image:url(../../images/15.png); background-repeat:no-repeat; background-position:center center; background-size:contain"></div>--%>
<%--            </div>--%>
<%--            <div class="hotM_4R_1 br">--%>
<%--                <div style="width:100%; height:100%;background-image:url(../../images/16.png); background-repeat:no-repeat; background-position:center center; background-size:contain"></div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--    <div class="hotM_5">--%>
<%--        <div class="hotM_5L">--%>
<%--            <div style="width:100%; height:100%;background-image:url(../../images/17.png); background-repeat:no-repeat; background-position:center center; background-size:contain"></div>--%>
<%--        </div>--%>
<%--        <div class="hotM_5L">--%>
<%--            <div style="width:100%; height:100%;background-image:url(../../images/18.png); background-repeat:no-repeat; background-position:center center; background-size:contain"></div>--%>
<%--        </div>--%>
<%--        <div class="hotM_5L">--%>
<%--            <div style="width:100%; height:100%;background-image:url(../../images/19.png); background-repeat:no-repeat; background-position:center center; background-size:contain"></div>--%>
<%--        </div>--%>
<%--        <div class="hotM_5L br">--%>
<%--            <div style="width:100%; height:100%;background-image:url(../../images/20.png); background-repeat:no-repeat; background-position:center center; background-size:contain"></div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<%--<div class="clear"></div>--%>
<%--<div class="kbox"></div>--%>
<div class="likebox">

    <div class="likeTit">
        <img src="../../images/heart.png" /><span>精品推荐</span>
        <div class="totop"><a href="javascript:scrollTo(0,0)"><img src="images/totop.png" /></a></div>
    </div>
    <ul id="shoplistsub">
<%--        <li>--%>
<%--            <a href="xq.html">--%>
<%--                <img src="../../images/21.png" class="proimg"/>--%>
<%--                <p class="tit">三利 毛巾家纺纯棉吸水 提缎面巾两条装</p>--%>
<%--                <p class="price">￥29.9<span>￥49.9</span><img src="../../images/f3.png" /></p>--%>
<%--            </a>--%>
<%--        </li>--%>
    </ul>
    <ul id="shoplistsub1">

    </ul>
    <ul id="shoplistsub2">

    </ul>
    <ul id="shoplistsub3">

    </ul>
    <ul id="shoplistsub4">

    </ul>
    <ul id="shoplistsub5">

    </ul>
    <ul id="shoplistsub6">

    </ul>
</div>
<div class="fbox"></div>
<div class="footbox">
    <div class="footer">
        <ul>
            <li class="on">
                <a href="index.html">
                    <img src="../../images/f1.png" />
                    <p>首页</p>
                </a>
            </li>
            <li>
                <a href="${APP_PATH}/category">
                    <img src="../../images/f02.png" />
                    <p>分类</p>
                </a>
            </li>
            <li>
                <a href="${APP_PATH }/user/collection">
                    <img src="../../images/f03.png" />
                    <p>收藏</p>
                </a>
            </li>
            <li>
                <a href="${APP_PATH }/user/login">
                    <img src="../../images/f04.png" />
                    <p>我的</p>
                </a>
            </li>
        </ul>
    </div>
</div>
<script type="text/javascript">
    function scoreshop() {
        window.location.href="${APP_PATH}/scoreshop";
    }
</script>
</body>
<script type="text/javascript">

    var page =1;
    var scrollTop = 0;
    var windowHeight = 0;
    window.onload = function(){
        banner();
        tuijian();
    }

    function banner(){
        var interv=2000; //切换间隔时间
        var interv2=10; //切换速速
        var opac1=80; //文字背景的透明度
        var source="fade_focus" //焦点轮换图片容器的id名称

//获取对象
        function getTag(tag,obj){
            if(obj==null){
                return document.getElementsByTagName(tag)
            }else{
                return obj.getElementsByTagName(tag)
            }
        }
        function getid(id){
            return document.getElementById(id)
        };
        var opac=0,j=0,t=63,num,scton=0,timer,timer2,timer3;
        var id=getid(source);
        id.removeChild(getTag("div",id)[0]);
        var li=getTag("li",id);
        var div=document.createElement("div");
        var title=document.createElement("div");
        var span=document.createElement("span");
        var button=document.createElement("div");
        button.className="button";
        for(var i=0;i<li.length;i++){
            var a=document.createElement("a");
            a.innerHTML=i+1;
            a.onclick=function(){
                clearTimeout(timer);
                clearTimeout(timer2);
                clearTimeout(timer3);
                j=parseInt(this.innerHTML)-1;
                scton=0;
                t=63;
                opac=0;
                fadeon();
            };
            a.className="b1";
            a.onmouseover=function(){
                this.className="b2"
            };
            a.onmouseout=function(){
                this.className="b1";
                sc(j)
            };
            button.appendChild(a);
        }
//控制图层透明度
        function alpha(obj,n){
            if(document.all){
                obj.style.filter="alpha(opacity="+n+")";
            }else{
                obj.style.opacity=(n/100);
            }
        }
//控制焦点按钮
        function sc(n){
            for(var i=0;i<li.length;i++){
                button.childNodes[i].className="b1"
            };
            button.childNodes[n].className="b2";
        }
        title.className="num_list";
        title.appendChild(span);
        alpha(title,opac1);
        id.className="d1";
        div.className="d2";
        id.appendChild(div);
        id.appendChild(title);
        id.appendChild(button);
//渐显
        var fadeon=function(){
            opac+=5;
            div.innerHTML=li[j].innerHTML;
            span.innerHTML=getTag("img",li[j])[0].alt;
            alpha(div,opac);
            if(scton==0){
                sc(j);
                num=-2;scrolltxt();
                scton=1
            };
            if(opac<100){
                timer=setTimeout(fadeon,interv2)
            }else{
                timer2=setTimeout(fadeout,interv);
            };
        }
//渐隐
        var fadeout=function(){
            opac-=5;
            div.innerHTML=li[j].innerHTML;
            alpha(div,opac);
            if(scton==0){
                num=2;
                scrolltxt();
                scton=1};
            if(opac>0){
                timer=setTimeout(fadeout,interv2)
            }else{
                if(j<li.length-1){
                    j++
                }else{
                    j=0
                };
                fadeon()
            };
        }
//滚动文字
        var scrolltxt=function(){
            t+=num;
            span.style.marginTop=t+"px";
            if(num<0 && t>3){
                timer3=setTimeout(scrolltxt,interv2)
            }else if(num>0 && t<62){
                timer3=setTimeout(scrolltxt,interv2)
            }else{
                scton=0
            }
        };
        fadeon();




        var divDate=document.getElementsByClassName('divDate');
        console.log("kaishi");
        for(i=0;i<divDate.length;i++){
            console.log(divDate[i].innerText)
            var myDate=new Date(divDate[i].innerText);
            var myyear=myDate.getFullYear();
            var mymonth=myDate.getMonth();
            var myday=myDate.getDate();
            divDate[i].innerHTML=mymonth+"-"+myday;
            divDate[i].style.color='#1c1c1c';
        }
        tuijian();
    }

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
            tuijian();
        }
    }
    // $(document).ready(function(){
        function tuijian(){
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
                                $("#shoplistsub").html(content); //局部刷新
                                page = 1+1;
                                break;
                            case 2:
                                $("#shoplistsub1").html(content); //局部刷新
                                page = 2+1;
                                break;
                            case 3:
                                $("#shoplistsub2").html(content); //局部刷新
                                page = 3+1;
                                break;
                            case 4:
                                $("#shoplistsub3").html(content); //局部刷新
                                page = 4+1;
                                break;
                            case 5:
                                $("#shoplistsub4").html(content); //局部刷新
                                page = 5+1;
                                break;
                            case 6:
                                $("#shoplistsub5").html(content); //局部刷新
                                page = 6+1;
                                break;
                            case 7:
                                $("#shoplistsub6").html(content); //局部刷新
                                page = 7+1;
                                break;
                        }
                    }else{
                        //获取失败
                    }
                }
            })
        }


    // });
    // //页面加载完后执行

    // //实现相关推荐的请求逻辑
    // function recommend() {
    //
    // }
</script>
</body>
</html>