<%--
  Created by IntelliJ IDEA.
  User: liuweiran
  Date: 2020/3/24
  Time: 6:57 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            //选择尺寸
            $('.sizetype').click(function(){
                $("#size").animate({bottom:"0"},500);
                $('.f_mask0').show();
                $("body").css({'height':'100%','overflow':'hidden'});
            })
            $('.size3 a').click(function(){
                $('.f_mask0').hide();
                $('#size').animate({bottom:"-80%"},500);
                $("body").css({'height':'auto','overflow':''});
            })

            $('.size1_3 img').click(function(){
                $('.f_mask0').hide();
                $('#size').animate({bottom:"-80%"},500);
                $("body").css({'height':'auto','overflow':''});
            })

            //
            $('.hdbox_2 ul li').click(function(){
                $('.hdbox_2 ul li').removeClass('on');
                $(this).addClass('on');
            })

        })
    </script>
    <script type="text/javascript">
        //选项卡
        function setTab(name,cursel,n){
            for(i=1;i<=n;i++){
                var menu=document.getElementById(name+i);
                var con=document.getElementById("con_"+name+"_"+i);
                menu.className=i==cursel?"hover":"";
                con.style.display=i==cursel?"block":"none";
            }
        }
    </script>
</head>

<body>
<div class="hdbox">
    <div class="hdbox0">
        <div class="hdbox_1"><a onclick="javascript:history.back(-1)" class="goback"><img src="images/goback.png"></a></div>
        <div class="hdbox_2">
            <ul>
                <li class="on"><a href="#m1">商品</a></li>
                <li><a href="#m2">详情</a></li>
                <li><a href="#m3">评价</a></li>
            </ul>
        </div>
        <div class="hdbox_3">
            <a onclick="javascript:history.back(-1)"><img src="images/h2.png" /></a>
            <a onclick="javascript:history.back(-1)"><img src="images/h1.png" /></a>
        </div>
    </div>
</div>
<div class="hbox"></div>
<a name="m1">
    <div class="xqbox1">
        <img src="images/xq3.png" width="100%"/>
        <p class="tit">Pristian zouboutin 2015秋季新款羽毛蕾丝抹胸长拖尾镶钻拉链婚纱</p>
        <div class="qita">
            <p class="p1">￥489<span>新品促销</span></p>
            <p class="p2">全国包邮   |   销量488</p>
        </div>
    </div>
</a>
<div class="xqbox2">
    <div class="xqbox2L">
        <img src="images/my3.png" />
        <span>领取优惠券</span>
    </div>
    <div class="xqbox2R">
        <img src="images/more.png">
    </div>
</div>
<div class="clear"></div>
<div class="kbox"></div>
<div class="xqbox2 sizetype">
    <div class="xqbox2L">
        <span>请选择尺码</span>
    </div>
    <div class="xqbox2R">
        <img src="images/more.png">
    </div>
</div>
<div class="clear"></div>
<div class="kbox"></div>
<a name="m3">
    <div class="xqpj">
        <div class="xqpjtit">
            <div class="xqbox2L">
                <span>商品评价(99)</span>
            </div>
            <div class="xqbox2R">
                <img src="images/more.png">
            </div>
        </div>
        <div class="xqpjbox">
            <div class="pj1">
                <img src="images/tx.png" />
                <span>喵星人</span>
            </div>
            <div class="pj2">收到了，费了老大劲才穿上，但是非常合身，效果特别好，家里人都说很美，太棒了，五分好评。</div>
            <div class="pj3">2015-12-28  颜色：白色  尺码：S</div>
        </div>
        <div class="morepj">
            <a href="pingjialist.html">查看更多评价</a>
        </div>
    </div>
</a>
<div class="clear"></div>
<div class="kbox"></div>
<div class="xqdp">
    <div class="xqdp_1">
        <div class="xqdp1_1">
            <div class="dpimg"><img src="images/dp1.png"></div>
            <div class="dptxt">
                <p class="p1">天使婚纱礼服馆</p>
                <p class="p2">总销量：1368  收藏数：987</p>
            </div>
        </div>
        <div class="xqdp1_2">
            <div class="scbox">
                <img src="images/xq4.png">
                <span>收藏店铺</span>
            </div>
        </div>
    </div>
    <div class="dpdengji">
        <ul>
            <li>
                <div class="v1">描述相符<span>4.7</span></div>
                <div class="v2">高</div>
            </li>
            <li>
                <div class="v1">质量满意<span>4.7</span></div>
                <div class="v2">高</div>
            </li>
            <li>
                <div class="v1">价格合理<span>4.7</span></div>
                <div class="v2">高</div>
            </li>
        </ul>
    </div>
    <div class="xqbtn">
        <a href="dqxq2.html">全部商品(78)</a>
        <a href="dpxq.html">进店逛逛</a>
    </div>
</div>
<div class="clear"></div>
<div class="kbox"></div>
<div class="xgtj">
    <div class="tjtit">相关推荐</div>
    <div class="tjcon">
        <ul>
            <li>
                <a href="xq.html">
                    <img src="images/xq2.png" />
                    <div class="tit"><span>￥88.8</span></div>
                </a>
            </li>
            <li>
                <a href="xq.html">
                    <img src="images/xq2.png" />
                    <div class="tit"><span>￥88.8</span></div>
                </a>
            </li>
            <li>
                <a href="xq.html">
                    <img src="images/xq2.png" />
                    <div class="tit"><span>￥88.8</span></div>
                </a>
            </li>
            <li>
                <a href="xq.html">
                    <img src="images/xq2.png" />
                    <div class="tit"><span>￥88.8</span></div>
                </a>
            </li>
        </ul>
    </div>
</div>
<div class="clear"></div>
<a name="m2"><div class="kbox"></div></a>

<div class="xqtab">
    <div class="Menubox">
        <ul>
            <li class="hover" onclick="setTab('two',1,3)" id="two1">图文详情</li>
            <li class="" onclick="setTab('two',2,3)" id="two2">产品参数</li>
            <li class="" onclick="setTab('two',3,3)" id="two3">热卖推荐</li>
        </ul>
    </div>
    <div class="Contentbox">
        <div id="con_two_1">
            <div class="xqsub">
                <img src="images/xq1.png" />
            </div>
        </div>
        <div style="display:none" id="con_two_2">
            <div class="canshu">
                <div class="canshu_1">
                    <p class="pl">袖长</p>
                    <p class="pr">七分袖</p>
                </div>
            </div>
            <div class="canshu">
                <div class="canshu_1">
                    <p class="pl">销售渠道类型</p>
                    <p class="pr">纯电商</p>
                </div>
            </div>
            <div class="canshu">
                <div class="canshu_1">
                    <p class="pl">货号</p>
                    <p class="pr">185234</p>
                </div>
            </div>
            <div class="canshu">
                <div class="canshu_1">
                    <p class="pl">品牌</p>
                    <p class="pr">皇宫婚纱</p>
                </div>
            </div>
            <div class="canshu">
                <div class="canshu_1">
                    <p class="pl">礼服裙摆</p>
                    <p class="pr">拖尾</p>
                </div>
            </div>
            <div class="canshu">
                <div class="canshu_1">
                    <p class="pl">颜色分类</p>
                    <p class="pr">白色</p>
                </div>
            </div>
            <div class="canshu">
                <div class="canshu_1">
                    <p class="pl">尺码</p>
                    <p class="pr">X,L,XL,XXL,量身定做</p>
                </div>
            </div>
            <div class="canshu">
                <div class="canshu_1">
                    <p class="pl">上市年份</p>
                    <p class="pr">2015年冬季</p>
                </div>
            </div>
            <div class="canshu">
                <div class="canshu_1">
                    <p class="pl">材质</p>
                    <p class="pr">网纱</p>
                </div>
            </div>
        </div>
        <div style="display:none" id="con_two_3">
            <div class="likebox bort">
                <ul>
                    <li>
                        <a href="xq.html">
                            <img src="images/dp3.png" class="proimg"/>
                            <p class="tit">三利 毛巾家纺纯棉吸水 提缎面巾两条装</p>
                            <p class="price">￥29.9<span>￥49.9</span><img src="images/f3.png" /></p>
                        </a>
                    </li>
                    <li>
                        <a href="xq.html">
                            <img src="images/dp4.png" class="proimg"/>
                            <p class="tit">韩国代购正品超爆款 </p>
                            <p class="price">￥198.0<span>￥286.0</span><img src="images/f3.png" /></p>
                        </a>
                    </li>
                    <li>
                        <a href="xq.html">
                            <img src="images/dp5.png" class="proimg"/>
                            <p class="tit">三利 毛巾家纺纯棉吸水 提缎面巾两条装</p>
                            <p class="price">￥29.9<span>￥49.9</span><img src="images/f3.png" /></p>
                        </a>
                    </li>
                    <li>
                        <a href="xq.html">
                            <img src="images/dp6.png" class="proimg"/>
                            <p class="tit">韩国代购正品超爆款 休闲迷彩磨砂真皮运动鞋女单鞋</p>
                            <p class="price">￥198.0<span>￥286.0</span><img src="images/f3.png" /></p>
                        </a>
                    </li>
                    <li>
                        <a href="xq.html">
                            <img src="images/dp7.png" class="proimg"/>
                            <p class="tit">三利 毛巾家纺纯棉吸水 提缎面巾两条装</p>
                            <p class="price">￥29.9<span>￥49.9</span><img src="images/f3.png" /></p>
                        </a>
                    </li>
                    <li>
                        <a href="xq.html">
                            <img src="images/dp8.png" class="proimg"/>
                            <p class="tit">韩国代购正品超爆款 休闲迷彩磨砂真皮运动鞋女单鞋</p>
                            <p class="price">￥198.0<span>￥286.0</span><img src="images/f3.png" /></p>
                        </a>
                    </li>
                    <li>
                        <a href="xq.html">
                            <img src="images/dp3.png" class="proimg"/>
                            <p class="tit">三利 毛巾家纺纯棉吸水 提缎面巾两条装</p>
                            <p class="price">￥29.9<span>￥49.9</span><img src="images/f3.png" /></p>
                        </a>
                    </li>
                    <li>
                        <a href="xq.html">
                            <img src="images/dp4.png" class="proimg"/>
                            <p class="tit">韩国代购正品超爆款 休闲迷彩磨砂真皮运动鞋女单鞋</p>
                            <p class="price">￥198.0<span>￥286.0</span><img src="images/f3.png" /></p>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<div class="clear"></div>
<div class="xqbotbox">
    <div class="xqbotbox0">
        <div class="xqbotboxL">
            <ul>
                <li>
                    <a href="javascript:void()">
                        <img src="images/xqf1.png" />
                        <p>客服</p>
                    </a>
                </li>
                <li>
                    <a href="dpxq.html">
                        <img src="images/xqf2.png" />
                        <p>店铺</p>
                    </a>
                </li>
                <li>
                    <a href="javascript:void()">
                        <img src="images/xqf3.png" />
                        <p>收藏</p>
                    </a>
                </li>
            </ul>
        </div>
        <div class="xqbotboxR">
            <a class="a2 sizetype">立即购买</a>
            <a class="a1 sizetype">加入购物车</a>
        </div>
    </div>
</div>
<div class="xzsize">
    <div class="xzsize0">
        <div class="f_mask0"></div>
        <div id="size">
            <div class="size1">
                <div class="size1_1">
                    <img src="images/gwc1.png" />
                </div>
                <div class="size1_2">
                    <p class="p1">￥489.00</p>
                    <p class="p2">商品编号：2015125412654</p>
                    <p class="p3">库存13540件</p>
                </div>
                <div class="size1_3">
                    <img src="images/close.png" />
                </div>
            </div>
            <div class="size2">
                <div class="size2_1">
                    <p class="tit">颜色</p>
                    <a href="javascript:void()" class="on">白色</a>
                </div>
                <div class="size2_1">
                    <p class="tit">尺码</p>
                    <a href="javascript:void()">X</a>
                    <a href="javascript:void()">L</a>
                    <a href="javascript:void()">XL</a>
                    <a href="javascript:void()">XXL</a>
                    <a href="javascript:void()">量身定做</a>
                </div>
                <div class="size2_1">
                    <p class="tit">数量</p>
                    <div class="lnums">
                        <div class="num1">-</div>
                        <div class="num2">1</div>
                        <div class="num3">+</div>
                    </div>
                </div>
            </div>
            <div class="size3">
                <a href="javascript:void()">确定</a>
            </div>
        </div>
    </div>
</div>
</body>
</html>