package xyz.taobaok.www.util.wechatutil;


import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *  处理转换xml文件
 */
public class MessageType {

    public static final String TEXT_MESSAGE = "text";
    public static final String RESP_MESSAGE_TYPE_TEXT = "text";
    public static final String REQ_MESSAGE_TYPE_EVENT = "event";
    public static final String EVENT_TYPE_UNSUBSCRIBE = "unsubscribe";
    public static final String EVENT_TYPE_SUBSCRIBE = "subscribe";
    public static final String EVENT_TYPE_CLICK = "CLICK";

    public static Map<String,String> parseXml(HttpServletRequest request){
         // 将解析结果存储在HashMap中
         Map<String, String> map = new HashMap<String, String>();
            //从request中取得输入流
        ServletInputStream inputStream = null;
        try {
            inputStream = request.getInputStream();

        //读取流
            SAXReader saxReader = new SAXReader();
        Document document = null;
        try {
            document = saxReader.read(inputStream);
        } catch (DocumentException e) {
            e.printStackTrace();
        }
        //得到xml根元素
            Element root = document.getRootElement();

            //得到根元素得所有子节点
            List<Element> elements = root.elements();

            //遍历子节点
            for (Element element : elements) {
                map.put(element.getName(),element.getText());
            }
            //释放关流
            inputStream.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return map;
    }

    //关注事件回复信息内容
    public static String menuText() {
        return "感谢关注涿鹿领券分享！\n获取优惠券方式，请直接：\n打开【手机淘宝】————>\n选择要购买的【商品】————>" +
                "\n进入商品【详情页】————>\n长按商品名称【复制宝贝链接】————>\n打开微信————>\n进入【涿鹿领券分享】————>\n粘贴标题查询优惠券";
    }
}
