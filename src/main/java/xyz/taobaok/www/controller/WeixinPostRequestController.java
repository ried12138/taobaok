package xyz.taobaok.www.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import xyz.taobaok.www.util.MessageType;
import xyz.taobaok.www.util.wechatutil.WebChatService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import java.util.Map;

@Controller
public class WeixinPostRequestController {

    private static String token ="0ADCEAF6CCE07DF3";            //服务器链接校验token
    private static Logger logger = LoggerFactory.getLogger(WeixinPostRequestController.class);




    @RequestMapping(value = "/wechat",method = RequestMethod.POST)
    @ResponseBody
    public void RequestPostWeiXinInfo(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/xml");
        Map<String, String> map = MessageType.parseXml(request);
        if (map.size() <=0){
            try {
                response.getWriter().write("");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        logger.info("来自："+map.get("FromUserName")+"的消息，接收方："+map.get("ToUserName")
                +",消息类型："+map.get("MsgType")+",消息内容："+map.get("Content")+",发送时间："+map.get("CreateTime"));
        String msgType = map.get("MsgType");
        String xml=null;
        if (msgType.equals(MessageType.REQ_MESSAGE_TYPE_EVENT)){
            xml = WebChatService.parseEvent(map);           //事件处理
        }else{
            xml = WebChatService.parseMessage(map);         //信息处理
        }
        try {
            response.getWriter().write(xml);
        } catch (IOException e) {
            response.getWriter().write("");
        }
    }
    /**
     *  服务器与微信公众号校验token值
     * @param signature
     * @param timestamp
     * @param nonce
     * @param echostr
     * @return
     */
    @RequestMapping(value = "/wechat",method = RequestMethod.GET, produces = "text/html;charset=utf-8")
    @ResponseBody
    public String RequestGetWeixin(@RequestParam("signature") String signature, @RequestParam("timestamp") String timestamp,
                                    @RequestParam("nonce") String nonce,@RequestParam("echostr")String echostr){

        //字典顺序排序
        String[] attr = {token,timestamp,nonce};
        Arrays.sort(attr);
        StringBuffer content = new StringBuffer();
        for (int i =0;i < attr.length; i++){
            content.append(attr[i]);
        }

        //sha1加密
        MessageDigest md = null;
        String temp = null;
        try {
            md = MessageDigest.getInstance("SHA-1");
            byte[] digest = md.digest(content.toString().getBytes());
            temp = byteTStr(digest);
            logger.info("加密后的token："+temp);
            //小写对比
            if ((temp.toLowerCase()).equals(signature)){
                return echostr;
            }else{
                return "";
            }
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return "";
    }
    private static String byteTStr(byte[]byteArray){
        String strDigest = "";
        for (int i = 0; i < byteArray.length; i++) {
            strDigest += byteToHexStr(byteArray[i]);
        }
        return strDigest;
    }
    private static String byteToHexStr(byte mByte){
        char[] Digit = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A','B', 'C', 'D', 'E', 'F' };
        char[] tempArr = new char[2];
        tempArr[0] = Digit[(mByte >>> 4)& 0X0F];
        tempArr[1] = Digit[mByte & 0X0F];
        String s = new String(tempArr);
        return s;
    }
}