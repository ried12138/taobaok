package xyz.taobaok.www.weixinserver;

import java.io.IOException;
import java.util.Map;

public interface WebChatService {

    String parseMessage(Map<String,String> map)throws IOException;

    String parseEvent(Map<String,String> map);

    String byteTStr(byte[]byteArray);
}
