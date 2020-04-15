<%--
  Created by IntelliJ IDEA.
  User: liuweiran
  Date: 2020/4/10
  Time: 11:16 上午
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
    <script type="text/javascript" src="../js/jquery-1.8.1.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('.gwccheck').click(function(){
                if($(this).attr("class")=="gwccheck on"){
                    $(this).removeClass('on');
                }else{
                    $(this).addClass('on');
                }
            })
        })
    </script>
</head>

<body>
<div class="headerbox">
    <div class="header">
        <div class="headerL">
            <a onclick="javascript:history.back(-1)" class="goback"><img src="../images/goback.png" /></a>
        </div>
        <div class="headerC">
            <p>收藏夹</p>
        </div>
        <div class="headerR"></div>
    </div>
</div>
<div class="clear"></div>
<div class="hbox"></div>
<div class="kbox"></div>
<div class="gwcbox">
    <div class="gwcbox_1">
<%--        <div class="gwc1_1">--%>
<%--            <div class="g1">--%>
<%--                <div class="gwccheck on"></div>--%>
<%--            </div>--%>
<%--            <div class="g2">--%>
<%--                <a href="dpxq.html">--%>
<%--                    <span>皇宫婚纱旗舰店</span>--%>
<%--                    <img src="../images/mre1.png" />--%>
<%--                </a>--%>
<%--            </div>--%>
<%--            <div class="g3">--%>
<%--                <img src="../images/quanicon.png" />--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="clear"></div>--%>
        <div class="gwc1_2" id="gwcfore">
            <c:if test="${not empty UserBehaviorDataBean}">
            <c:forEach items="${UserBehaviorDataBean}" var="list">
                <c:if test="${not empty list}" >
                    <div class="gwcone">
                            <%--                <div class="go1">--%>
                            <%--                    <div class="gwccheck on"></div>--%>
                            <%--                </div>--%>
                        <div class="go2"><a href="${APP_PATH}/item?id=${list.collectionId}"><img src="${list.mainPic}" /></a></div>
                        <div class="go3">
                            <div class="go3_1">
                                <a href="${APP_PATH}/item?id=${list.collectionId}"><p class="p1">${list.title}</p></a>
                                <p class="p2">￥${list.originalPrice}</p>
                            </div>
                            <div class="go3_2">
                                    <%--                        <p class="p3">颜色：白色；尺码：L</p>--%>
                                <p class="p4">￥${list.actualPrice}</p>
                            </div>
                            <div class="go3_3">
                                    <%--                        <div class="num1">-</div>--%>
                                    <%--                        <div class="num2">1</div>--%>
                                    <%--                        <div class="num3">+</div>--%>
                                <div class="del"><img onclick="delcoll(${list.id},${list.collectionId})" src="../images/del.png" /></div>
                            </div>
                        </div>
                    </div>
                </c:if>
            </c:forEach>
            </c:if>
            <c:if test="${empty UserBehaviorDataBean}">
                <div class="paysuccess">
                    <div class="pay30">
                        <img src="../../images/gwc.jpg" />
                        <p>购物车还是空的</p>
                    </div>
                    <div class="pay40">
                        <a href="${APP_PATH}/index">去逛逛</a>
                    </div>
                </div>
            </c:if>
<%--            <div class="gwcone">--%>
<%--                <div class="go1">--%>
<%--                    <div class="gwccheck on"></div>--%>
<%--                </div>--%>
<%--                <div class="go2"><a href="xq.html"><img src="../images/gwc2.png" /></a></div>--%>
<%--                <div class="go3">--%>
<%--                    <div class="go3_1">--%>
<%--                        <a href="xq.html"><p class="p1">2015新款敬酒服冬季新娘结婚韩版...</p></a>--%>
<%--                        <p class="p2">￥895</p>--%>
<%--                    </div>--%>
<%--                    <div class="go3_2">--%>
<%--                        <p class="p3">颜色：红色；尺码：L</p>--%>
<%--                        <p class="p4">￥298.9</p>--%>
<%--                    </div>--%>
<%--                    <div class="go3_3">--%>
<%--                        <div class="num1">-</div>--%>
<%--                        <div class="num2">1</div>--%>
<%--                        <div class="num3">+</div>--%>
<%--                        <div class="del"><img src="../images/del.png" /></div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
        </div>
    </div>
    <div class="kbox"></div>
<%--    <div class="gwcbox_1">--%>
<%--        <div class="gwc1_1">--%>
<%--            <div class="g1">--%>
<%--                <div class="gwccheck"></div>--%>
<%--            </div>--%>
<%--            <div class="g2">--%>
<%--                <a href="dpxq.html">--%>
<%--                    <span>小米零食铺</span>--%>
<%--                    <img src="../images/mre1.png" />--%>
<%--                </a>--%>
<%--            </div>--%>
<%--            <div class="g3">--%>
<%--                <img src="../images/quanicon.png" />--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="clear"></div>--%>
<%--        <div class="gwc1_2">--%>
<%--            <div class="gwcone">--%>
<%--                <div class="go1">--%>
<%--                    <div class="gwccheck"></div>--%>
<%--                </div>--%>
<%--                <div class="go2"><a href="xq.html"><img src="../images/gwc3.png" /></a></div>--%>
<%--                <div class="go3">--%>
<%--                    <div class="go3_1">--%>
<%--                        <a href="xq.html"><p class="p1">秋冬款韩版半高领中长款宽松套头打...</p></a>--%>
<%--                        <p class="p2">￥15.5</p>--%>
<%--                    </div>--%>
<%--                    <div class="go3_2">--%>
<%--                        <p class="p3">口味：烧烤味</p>--%>
<%--                        <p class="p4">￥9.9</p>--%>
<%--                    </div>--%>
<%--                    <div class="go3_3">--%>
<%--                        <div class="num1">-</div>--%>
<%--                        <div class="num2">1</div>--%>
<%--                        <div class="num3">+</div>--%>
<%--                        <div class="del"><img src="../images/del.png" /></div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="gwcone">--%>
<%--                <div class="go1">--%>
<%--                    <div class="gwccheck"></div>--%>
<%--                </div>--%>
<%--                <div class="go2"><a href="xq.html"><img src="../images/gwc3.png" /></a></div>--%>
<%--                <div class="go3">--%>
<%--                    <div class="go3_1">--%>
<%--                        <a href="xq.html"><p class="p1">秋冬款韩版半高领中长款宽松套头打...</p></a>--%>
<%--                        <p class="p2">￥45</p>--%>
<%--                    </div>--%>
<%--                    <div class="go3_2">--%>
<%--                        <p class="p3">颜色：白色；尺码：L</p>--%>
<%--                        <p class="p4">￥29.8</p>--%>
<%--                    </div>--%>
<%--                    <div class="go3_3">--%>
<%--                        <div class="num1">-</div>--%>
<%--                        <div class="num2">1</div>--%>
<%--                        <div class="num3">+</div>--%>
<%--                        <div class="del"><img src="../images/del.png" /></div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
    <div class="kbox"></div>
</div>
<div class="fbox1"></div>
<%--<div class="hejiBox">--%>
<%--    <div class="heji">--%>
<%--        <div class="heji_1">--%>
<%--            <div class="gwccheck on"></div>--%>
<%--        </div>--%>
<%--        <div class="heji_2">全选</div>--%>
<%--        <div class="heji_3"><p>合计：<span>￥784.80</span></p></div>--%>
<%--        <div class="heji_4">为您节省￥605.2</div>--%>
<%--        <div class="heji_5">--%>
<%--            <a href="jiesuan.html">去结算(2)</a>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
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
            <li class="on">
                <a href="${APP_PATH }/user/collection">
                    <img src="../images/f3.png" />
                    <p>收藏</p>
                </a>
            </li>
            <li>
                <a href="${APP_PATH }/user/login">
                    <img src="../images/f04.png" />
                    <p>我的</p>
                </a>
            </li>
        </ul>
    </div>
</div>
<script type="text/javascript">

    function delcoll(userid,collid) {
        var userid = userid;
        var collid = collid;
        $.ajax({
            type:"post",
            url:"${APP_PATH}/user/collectiondel",
            data:{
                userid:userid,
                collid:collid
            },
            success:function (result) {
                if (result.success){
                    //删除成功
                    window.location.href="${APP_PATH }/user/collection";
                }else{
                    //删除失败
                    alert(result.message)
                }
            }
        })
    }
</script>
<jsp:include page="zhanzhangtongji.jsp"/>
</body>
</html>
