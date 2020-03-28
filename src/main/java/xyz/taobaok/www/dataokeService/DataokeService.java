package xyz.taobaok.www.dataokeService;

import java.util.Map;

public interface DataokeService {

    String senDaTaoKeApiLink(String id);

    String SenDaTaoKeApiGoods(String id);

    String SendDaTaoKeApiTop();

    String SendDaTaoKeListSuperGoods(String search);
//    sendGet(String getUrl, Map<String, String> paraMap);
}
