package xyz.taobaok.www.util.wechatutil;

import xyz.taobaok.www.util.SystemPropsUtil;
import xyz.taobaok.www.util.dataoke.HttpUtils;
import xyz.taobaok.www.util.dataoke.SignMD5Util;

import java.io.UnsupportedEncodingException;
import java.util.TreeMap;

/**
 * @Author weiranliu
 * @Email liuweiran12138@outlook.com
 * @Date 2020/4/12   7:24 下午
 * @Version 1.0
 */
public class AccessTokenUtil {

    private static String url = "https://api.weixin.qq.com/cgi-bin/token";
    public static String requestAccessToken(){
        TreeMap<String,Object> paraMap = new TreeMap<String,Object>();
        paraMap.put("grant_type", "client_credential");
        paraMap.put("appid","wx1a4ad02c7c500599");
        paraMap.put("secret","cf419db20b750aaa63007ed3209c9783");
        String jsonString = null;
        try {
            jsonString = HttpUtils.sendGet(url, paraMap);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return jsonString;
    }
}
