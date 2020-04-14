package xyz.taobaok.www.util;


import jodd.props.Props;

import java.util.HashMap;

//初始化参数
public class SystemPropsUtil {
    //读取配置文件路径
    public static String env = "dev";
    //大淘客——热搜词api接口
    public static String getTop100 ="https://openapi.dataoke.com/api/category/get-top100";
    //大淘客开发者token
    public static String dataokeToken = "0ADCEAF6CCE07DF3";
    //大淘客开发则appSecret
    public static String appSecret = "bee6c934e19eeb5d03462b413f57187a";
    //大淘客转链接
    public static String getPrivilegeLink = "https://openapi.dataoke.com/api/tb-service/get-privilege-link";
    //大淘客商品详情
    public static String details="https://openapi.dataoke.com/api/goods/get-goods-details";
    //大淘客关键字商品搜索
    public static String listSuperGoods = "https://openapi.dataoke.com/api/goods/list-super-goods";
    //淘宝联盟搜索
    public static String getTbService="https://openapi.dataoke.com/api/tb-service/get-tb-service";
    //大淘客appkey
    public static String appKey="5e6c5505bb8eb";
    //大淘客pid
    public static String pid="mm_47344560_1373500358_110108500483";
    //9.9包邮模块
    public static String opgoods = "https://openapi.dataoke.com/api/goods/nine/op-goods-list";
    //猜你喜欢
    public static String byopen = "https://openapi.dataoke.com/api/goods/list-similer-goods-by-open";
    //精选专辑
    public static String catalogue="https://openapi.dataoke.com/api/goods/topic/catalogue";
    //淘宝官方活动推荐
    public static String tbTopic="https://openapi.dataoke.com/api/category/get-tb-topic-list";
    //各大榜单
    public static String rankingList="https://openapi.dataoke.com/api/goods/get-ranking-list";
    //超级分类
    public static String category="https://openapi.dataoke.com/api/category/get-super-category";
    //限时抢购
    public static String flashSale ="https://openapi.dataoke.com/api/category/ddq-goods-list";
    //热门活动
    public static String hotcatalogue="https://openapi.dataoke.com/api/goods/activity/catalogue";
    /**
     * 初始化所有配置参数
     */
    public static void init(){
        Props p = PropertiesUtil.getInstance("/application.properties");
        env = p.getValue("env.name");
        getTop100 = p.getValue("getTop100");
        dataokeToken = p.getValue("dataoketoken");
        appSecret = p.getValue("appSecret");
        getPrivilegeLink = p.getValue("getPrivilegeLink");
        details = p.getValue("details");
        appKey = p.getValue("appkey");
        pid = p.getValue("pid");
        listSuperGoods = p.getValue("listSuperGoods");
        getTbService = p.getValue("getTbService");
        opgoods = p.getValue("opgoods");
        byopen = p.getValue("byopen");
        catalogue = p.getValue("catalogue");
        tbTopic = p.getValue("tbTopic");
        rankingList = p.getValue("rankingList");
        category = p.getValue("category");
        flashSale = p.getValue("flashSale");
        hotcatalogue = p.getValue("hotcatalogue");
    }

}
