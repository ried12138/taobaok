package xyz.taobaok.www.util;


import jodd.props.Props;

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
    //大淘客appkey
    public static String appKey="5e6c5505bb8eb";
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
    }

}
