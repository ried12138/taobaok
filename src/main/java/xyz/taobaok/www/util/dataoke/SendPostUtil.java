package xyz.taobaok.www.util.dataoke;


import org.python.modules._systemrestart;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StringUtils;
import xyz.taobaok.www.controller.WeixinPostRequestController;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.*;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

//模拟发送http请求
public class SendPostUtil {

    private static Logger logger = LoggerFactory.getLogger(WeixinPostRequestController.class);

    //获取pc淘宝的商品名
    public static String SendGetTaobaoPCUrl(String url) throws IOException {
        //打开url链接
        URL getUrl = null;
        try {
            getUrl = new URL(url);
        } catch (MalformedURLException e) {
            e.printStackTrace();
        }
        HttpURLConnection con = null;
        try {
            con = (HttpURLConnection) getUrl.openConnection();
        } catch (IOException e) {
            e.printStackTrace();
        }

        con.setInstanceFollowRedirects(false);
        con.setConnectTimeout(5000);
        con.setRequestProperty("accept", "*/*");
        con.addRequestProperty("connection", "Keep-Alive");
        con.addRequestProperty("user-agent",
                "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.132 Safari/537.36");
        con.connect();
        //获取页面信息
        BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream(), "utf-8"));
        String line;
        String result = "";
        StringBuffer id = new StringBuffer("");
        while ((line = in.readLine()) != null) {
            result= "\n"+line;
        }
        System.out.println(result);
        return null;
    }

    //get请求淘宝详情页，返回商品id
    public static String SendGetTaobaoUrl(String url) throws IOException {

        //打开url链接
        URL getUrl = null;
        try {
            getUrl = new URL(url);
        } catch (MalformedURLException e) {
            e.printStackTrace();
        }
        HttpURLConnection con = null;
        try {
            con = (HttpURLConnection) getUrl.openConnection();
        } catch (IOException e) {
            e.printStackTrace();
        }
        con.setInstanceFollowRedirects(false);
        con.setConnectTimeout(5000);
        con.setRequestProperty("accept", "*/*");
        con.addRequestProperty("connection", "Keep-Alive");
        con.addRequestProperty("user-agent",
                "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.132 Safari/537.36");
        con.connect();
        //获取页面信息
        BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream(), "utf-8"));
        String line;
        StringBuffer id = new StringBuffer("");
        while ((line = in.readLine()) != null) {
            if (line.contains("var url =")){            //找到链接行 获取商品id
                int index = line.indexOf("h");
                int end = line.indexOf("?");
                String taobaourl = line.substring(index,end);
                String[] split = taobaourl.split("");
                for (String s : split) {
                    if (isNumberText(s)){
                        id.append(s);
                    }
                }
                break;
            }
        }
        if(id.length()==12){
            logger.info("被搜索的产品id："+id);
        }else{
            logger.info("获取错误商品id："+id);
        }
        return id.toString();
    }

    /**
     * 判断是否为数字字符串，如0011，10101，01
     * @param str
     * @return
     */
    public static boolean isNumberText(String str){
        if(StringUtils.isEmpty(str)){
            return false;
        }
        return isMatch("^([0-9]+)$", str);
    }

    /**
     * 正则表达式校验,符合返回True
     * @param regex 正则表达式
     * @param content 校验的内容
     * @return
     */
    public static boolean isMatch(String regex, CharSequence content){
        return Pattern.matches(regex, content);
    }
}
