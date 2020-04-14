package xyz.taobaok.www.dataokeapi.Service;

import java.io.UnsupportedEncodingException;

public interface DataokeService {

    String senDaTaoKeApiLink(String id) throws UnsupportedEncodingException;

    String SenDaTaoKeApiGoods(String id) throws UnsupportedEncodingException;

    String SendDaTaoKeApiTop() throws UnsupportedEncodingException;

    String SendDaTaoKeListSuperGoods(String wordName, Integer pageid, Integer pagesize, String sort) throws UnsupportedEncodingException;

    String SendDaTaoKeByOpen(Long id, int pagesize) throws UnsupportedEncodingException;

    String SendDaTaoKeNinePriceOPen(Integer pageSize,String pageId,String nineCid) throws UnsupportedEncodingException;

    String SendDaTaoKeCatalogue() throws UnsupportedEncodingException;

    String senDaTaoKetbTopic(Integer pageSize,String pageId,Integer type) throws UnsupportedEncodingException;

    String senDaTaoKetbrankingList(Integer rankType);

    String SendDaTaoKeCategory() throws UnsupportedEncodingException;

    String senDaTaoKeflashSale(String creatData);

    String SendDaTaoKeHotcatalogue(Integer num);
}
