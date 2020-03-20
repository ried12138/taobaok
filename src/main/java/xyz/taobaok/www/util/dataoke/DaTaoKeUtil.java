package xyz.taobaok.www.util.dataoke;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import xyz.taobaok.www.util.HttpUtils;
import xyz.taobaok.www.util.SignMD5Util;

import java.util.HashMap;
import java.util.Map;
import java.util.TreeMap;

//链接大淘客api对接工具类
//固定参数切勿修改，同步大淘客官网后修改
public class DaTaoKeUtil {
    private static String host ="https://openapi.dataoke.com/api/tb-service/get-privilege-link";            //转链
    private static String goods = "https://openapi.dataoke.com/api/goods/get-goods-details";                //商品详情
    private static final String appSecret = "bee6c934e19eeb5d03462b413f57187a";//应用sercret
    private static final String appKey = "5e6c5505bb8eb"; //应用key

    //转换推广链接
    public static String senDaTaoKeApiLink(String id){
        TreeMap<String,String> paraMap = new TreeMap<String,String>();
        paraMap.put("version","v1.1.1");
        paraMap.put("appKey",appKey);
        paraMap.put("goodsId",id);
        paraMap.put("pid","mm_47344560_1373500358_110108500483");
        paraMap.put("sign", SignMD5Util.getSignStr(paraMap,appSecret));
        String jsonString = HttpUtils.sendGet(host, paraMap);
        if (!jsonString.contains("成功")){
            return "";
        }
        return jsonString;
    }

    //获取商品详情
    public static String SenDaTaoKeApiGoods(String id){
        TreeMap<String,String> paraMap = new TreeMap<String,String>();
        paraMap.put("version","v1.2.1");
        paraMap.put("appKey",appKey);
        paraMap.put("goodsId",id);
        paraMap.put("pid","mm_47344560_1373500358_110108500483");
        paraMap.put("sign", SignMD5Util.getSignStr(paraMap,appSecret));
        String jsonString = HttpUtils.sendGet(goods, paraMap);
        if (!jsonString.contains("成功")){
            return "";
        }
        return jsonString;
    }

    public static String sendGet(String getUrl, Map<String, String> paraMap){
        if(paraMap == null){
            paraMap = new HashMap<String,String>();
        }
        paraMap= new TreeMap<String,String>(paraMap);
        StringBuilder sb = new StringBuilder();
        paraMap.entrySet().stream().forEach(entry ->{
            sb.append(entry.getKey());
            sb.append("=");
            sb.append(entry.getValue());
            sb.append("&");
        });
        getUrl = getUrl.contains("?")?getUrl:getUrl+"?";
        return HttpUtils.doGet(getUrl+sb.toString());
    }
}
