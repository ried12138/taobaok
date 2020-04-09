package xyz.taobaok.www.dataokeapi.Service;

public interface DataokeService {

    String senDaTaoKeApiLink(String id);

    String SenDaTaoKeApiGoods(String id);

    String SendDaTaoKeApiTop();

    String SendDaTaoKeListSuperGoods(String wordName, Integer pageid, Integer pagesize, String sort);

    String SendDaTaoKeByOpen(Integer id, int pagesize);

    String SendDaTaoKeNinePriceOPen(Integer pageSize,String pageId,String nineCid);

    String SendDaTaoKeCatalogue();

    String senDaTaoKetbTopic(Integer pageSize,String pageId,Integer type);

    String senDaTaoKetbrankingList(Integer rankType);

    String SendDaTaoKeCategory();
//    sendGet(String getUrl, Map<String, String> paraMap);
}
