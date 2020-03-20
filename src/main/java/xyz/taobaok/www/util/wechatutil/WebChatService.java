package xyz.taobaok.www.util.wechatutil;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import xyz.taobaok.www.util.MessageType;
import xyz.taobaok.www.util.SendPostUtil;
import xyz.taobaok.www.util.dataoke.DaTaoKeJsonToObjectResponse;
import xyz.taobaok.www.util.dataoke.DaTaoKeUtil;
import xyz.taobaok.www.util.dataoke.Dataa;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class WebChatService {

    // 处理微信发来的请求 map 消息业务处理分发
    public static String parseMessage(Map<String,String> map) throws IOException {

        //发送方账号
        String fromUserName = map.get("FromUserName");
        //开发者微信号
        String toUserName = map.get("ToUserName");
        //取得消息类型
        String msgType = map.get("MsgType");
        //// 发现直接把要返回的信息直接封装成replyMap集合，然后转换成 xml文件，
        HashMap<String, String> replyMap = new HashMap<>();
        replyMap.put("ToUserName",fromUserName);        //接收方
        replyMap.put("FromUserName",toUserName);        //发送方
        replyMap.put("CreateTime",String.valueOf(System.currentTimeMillis()));      //创建时间
        String respXml =null;
        if(msgType.equals(MessageType.TEXT_MESSAGE)){
            replyMap.put("MsgType", MessageType.RESP_MESSAGE_TYPE_TEXT);
            String content = map.get("Content");
            StringBuffer info = new StringBuffer("");
            String id = "";
            if (content.contains("https://item.taobao.com/item.htm?id=")){
                int i = content.indexOf("=");
                id = content.substring(i+1,content.length());
                String goods = DaTaoKeUtil.SenDaTaoKeApiGoods(id);
                if (!goods.equals("")){
                    JSONObject jsonObject = JSON.parseObject(goods);
                    String data = jsonObject.getString("data");
                    JSONObject jsonObject1 = JSON.parseObject(data);
                    String title = jsonObject1.getString("title");
                    content = "【"+title+"】";
                }else{
                    id ="";
                    info.append("抱歉,该商品没有优惠券！正在努力开发中...");
                }
            }else if (content.contains("https://")){
                int idnex = content.indexOf("/");
                String substring = content.substring(idnex + 2, content.length() - 1);
                int last = substring.indexOf(" ");
                //获取url
                String url = null;
                try {
                    url = substring.substring(0, last);
                } catch (Exception e) {
                    //异常处理
                    info.append("请输入正确的商品链接！不然我无法帮你找到优惠券。");
                    replyMap.put("Content",info.toString());
                    respXml = XmlUtil.xmlFormat(replyMap, true);
                    return  respXml;
                }
                StringBuffer httpurl = new StringBuffer();
                httpurl.append("https://").append(url);
                //返回商品id
                id = SendPostUtil.SendGetTaobaoUrl(httpurl.toString());
            }else{
                info.append("抱歉,该商品没有优惠券！正在努力开发中...");
            }
            //大淘客响应json
            String json = DaTaoKeUtil.senDaTaoKeApiLink(id);
            if (!json.equals("")){
                //json转对象
                DaTaoKeJsonToObjectResponse parse = JSONObject.parseObject(json, DaTaoKeJsonToObjectResponse.class);
                Dataa data = parse.getData();
                int TradenameIndex = content.indexOf("【");
                int TradenameEnd = content.indexOf("】");
                String Tradename = content.substring(TradenameIndex, TradenameEnd + 1);
                info.append("找到优惠券!长按复制到淘宝："+"\n"+"商品名称："+Tradename+"\n"+"------------------\n");
                if (!data.getCouponInfo().equals("")){
                    info.append("优惠面额:"+data.getCouponInfo());
                }
                if (!data.getCouponRemainCount().equals("")){
                    info.append("\n"+"优惠券剩余数："+data.getCouponRemainCount());
                }
                info.append("\n"+"优惠码："+data.getTpwd());
                if (!data.getCouponEndTime().equals("")){
                    info.append("\n"+"优惠券失效时间："+data.getCouponEndTime());
                }
                replyMap.put("Content",info.toString());
                respXml = XmlUtil.xmlFormat(replyMap, true);
            }else{
                replyMap.put("Content","抱歉,该商品没有优惠券！正在努力开发中...");
                respXml = XmlUtil.xmlFormat(replyMap, true);
            }
        }
        return respXml;
    }

    //事件消息业务分发
    public static String parseEvent(Map<String,String> map){
        String respXml=null;
        String fromUserName = map.get("FromUserName");      //发送方账号
        String toUserName = map.get("ToUserName");          //接收方账号（开发者账号）
        String msgType = map.get("MsgType");                //消息类型
        String eventType = map.get("Event");                //事件类型
        // 发现直接把要返回的信息直接封装成replyMap集合，然后转换成 xml文件，
        HashMap<String, String> replyMap = new HashMap<>();
        replyMap.put("ToUserName",fromUserName);            //接收账号
        replyMap.put("FromUserName",toUserName);            //发送账号
        replyMap.put("CreateTime",String.valueOf(System.currentTimeMillis()));      //创建时间
        //判断出发事件
        if (eventType.equals(MessageType.EVENT_TYPE_SUBSCRIBE)){          //关注
            //用集合封装
            replyMap.put("MsgType", MessageType.RESP_MESSAGE_TYPE_TEXT);
            replyMap.put("Content", MessageType.menuText());
            respXml = XmlUtil.xmlFormat(replyMap,true);
        }
        if (eventType.equals(MessageType.EVENT_TYPE_UNSUBSCRIBE)) {// 取消关注

        }
//         if (eventType.equals(MessageType.EVENT_TYPE_SCAN)) {// 用户已关注时的扫描带参数二维码
//
//             }
//         if (eventType.equals(MessageType.EVENT_TYPE_LOCATION)) {// 上报地理位置
//
//             }
//        if (eventType.equals(MessageType.EVENT_TYPE_CLICK)) {// 自定义菜单
//
//        }
        return respXml;
    }
}
