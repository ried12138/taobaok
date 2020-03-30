package xyz.taobaok.www.dataokeService;

import java.util.Map;

public interface DataokeService {

    String senDaTaoKeApiLink(String id);

    String SenDaTaoKeApiGoods(String id);

    String SendDaTaoKeApiTop();

    String SendDaTaoKeListSuperGoods(String wordName, Integer pageid, Integer pagesize);
//    sendGet(String getUrl, Map<String, String> paraMap);
}
