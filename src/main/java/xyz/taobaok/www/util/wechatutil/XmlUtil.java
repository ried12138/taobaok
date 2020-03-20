package xyz.taobaok.www.util.wechatutil;


import xyz.taobaok.www.util.CollectionUtil;
import xyz.taobaok.www.util.StringUtil;

import java.util.HashMap;
import java.util.Map;

//封装和处理xml文件
public class XmlUtil {
    private static final String PREFIX_XML = "<xml>";
    private static final String SUFFIX_XML = "</xml>";
    private static final String PREFIX_CDATA = "<![CDATA[";
    private static final String SUFFIX_CDATA = "]]>";

    //转换成xml，单层无嵌套  ture 加CDATA标签  false 不加CDATA标签
    public static String xmlFormat(Map<String, String> parm, boolean isAddCDATA){
        StringBuffer stringBuffer = new StringBuffer(PREFIX_XML);
        if (CollectionUtil.isNotEmpty(parm)){
            for (Map.Entry<String, String> entry : parm.entrySet()) {
                stringBuffer.append("<").append(entry.getKey()).append(">");
                if (isAddCDATA){
                    stringBuffer.append(PREFIX_CDATA);
                    if (StringUtil.isNotEmpty(entry.getValue())){
                        stringBuffer.append(entry.getValue());
                    }
                    stringBuffer.append(SUFFIX_CDATA);
                }else{
                    if (StringUtil.isNotEmpty(entry.getValue())) {
                        stringBuffer.append(entry.getValue());
                    }
                }
                stringBuffer.append("</").append(entry.getKey()).append(">");
            }
        }
        return stringBuffer.append(SUFFIX_XML).toString();
    }


}

