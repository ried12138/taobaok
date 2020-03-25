package xyz.taobaok.www.dataokeService.dataokeServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import xyz.taobaok.www.dataokeService.DataokeService;
import xyz.taobaok.www.util.SystemPropsUtil;
import xyz.taobaok.www.util.dataoke.HttpUtils;
import xyz.taobaok.www.util.dataoke.SignMD5Util;

import java.util.TreeMap;

//链接大淘客api对接工具类
//固定参数切勿修改，同步大淘客官网后修改
@Service
public class DataokeServiceImlp implements DataokeService {
//    private static String host ="https://openapi.dataoke.com/api/tb-service/get-privilege-link";            //转链
//    private static String goods = "https://openapi.dataoke.com/api/goods/get-goods-details";                //商品详情
//    private static final String appSecret = "bee6c934e19eeb5d03462b413f57187a";//应用sercret
//    private static final String appKey = "5e6c5505bb8eb"; //应用key


    //转换推广链接
    @Override
    public String senDaTaoKeApiLink(String id){
        TreeMap<String,String> paraMap = new TreeMap<String,String>();
        paraMap.put("version","v1.1.1");
        paraMap.put("appKey",SystemPropsUtil.appKey);
        paraMap.put("goodsId",id);
        paraMap.put("pid","mm_47344560_1373500358_110108500483");
        paraMap.put("sign", SignMD5Util.getSignStr(paraMap,SystemPropsUtil.appSecret));
        String jsonString = HttpUtils.sendGet(SystemPropsUtil.getPrivilegeLink, paraMap);
        if (!jsonString.contains("成功")){
            return "";
        }
        return jsonString;
    }

    //获取商品详情
    @Override
    public String SenDaTaoKeApiGoods(String id){
        TreeMap<String,String> paraMap = new TreeMap<String,String>();
        paraMap.put("version","v1.2.1");
        paraMap.put("appKey",SystemPropsUtil.appKey);
        paraMap.put("goodsId",id);
        paraMap.put("pid","mm_47344560_1373500358_110108500483");
        paraMap.put("sign", SignMD5Util.getSignStr(paraMap,SystemPropsUtil.appSecret));
        String jsonString = HttpUtils.sendGet(SystemPropsUtil.details, paraMap);
        if (!jsonString.contains("成功")){
            return "";
        }
        return jsonString;
    }
//    public String sendGet(String getUrl, Map<String, String> paraMap){
//        if(paraMap == null){
//            paraMap = new HashMap<String,String>();
//        }
//        paraMap= new TreeMap<String,String>(paraMap);
//        StringBuilder sb = new StringBuilder();
//        paraMap.entrySet().stream().forEach(entry ->{
//            sb.append(entry.getKey());
//            sb.append("=");
//            sb.append(entry.getValue());
//            sb.append("&");
//        });
//        getUrl = getUrl.contains("?")?getUrl:getUrl+"?";
//        return HttpUtils.doGet(getUrl+sb.toString());
//    }
}
