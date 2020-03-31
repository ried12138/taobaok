package xyz.taobaok.www.dataokeService;

public interface DataokeService {

    String senDaTaoKeApiLink(String id);

    String SenDaTaoKeApiGoods(String id);

    String SendDaTaoKeApiTop();

    String SendDaTaoKeListSuperGoods(String wordName, Integer pageid, Integer pagesize, String sort);

    String SendDaTaoKeByOpen(Integer id, int pagesize);
//    sendGet(String getUrl, Map<String, String> paraMap);
}
