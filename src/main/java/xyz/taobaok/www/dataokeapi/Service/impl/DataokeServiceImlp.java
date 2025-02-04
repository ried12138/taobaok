package xyz.taobaok.www.dataokeapi.Service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import org.springframework.stereotype.Service;
import xyz.taobaok.www.dataokeapi.Service.DataokeService;
import xyz.taobaok.www.util.SystemPropsUtil;
import xyz.taobaok.www.util.dataoke.HttpUtils;
import xyz.taobaok.www.util.dataoke.SignMD5Util;

import java.io.UnsupportedEncodingException;
import java.util.TreeMap;

//链接大淘客api对接工具类
@Service
public class DataokeServiceImlp implements DataokeService {


    //转换推广链接
    @Override
    public String senDaTaoKeApiLink(String id) throws UnsupportedEncodingException {
        TreeMap<String,Object> paraMap = new TreeMap<String,Object>();
        paraMap.put("version","v1.1.1");
        paraMap.put("appKey",SystemPropsUtil.appKey);
        paraMap.put("goodsId",id);
        paraMap.put("pid",SystemPropsUtil.pid);
        paraMap.put("sign", SignMD5Util.getSignStr(paraMap,SystemPropsUtil.appSecret));
        String jsonString = HttpUtils.sendGet(SystemPropsUtil.getPrivilegeLink, paraMap);
        return jsonString;
    }

    //获取商品详情
    @Override
    public String SenDaTaoKeApiGoods(String id) throws UnsupportedEncodingException {
        TreeMap<String,Object> paraMap = new TreeMap<String,Object>();
        paraMap.put("version","v1.2.1");
        paraMap.put("appKey",SystemPropsUtil.appKey);
        paraMap.put("goodsId",id);
        paraMap.put("pid",SystemPropsUtil.pid);
        paraMap.put("sign", SignMD5Util.getSignStr(paraMap,SystemPropsUtil.appSecret));
        String jsonString = HttpUtils.sendGet(SystemPropsUtil.details, paraMap);
        return jsonString;
    }


    //获取大淘客热搜词top100
    @Override
    public String SendDaTaoKeApiTop() throws UnsupportedEncodingException {
        TreeMap<String,Object> paraMap = new TreeMap<String,Object>();
        paraMap.put("version","v1.0.1");
        paraMap.put("appKey",SystemPropsUtil.appKey);
        paraMap.put("pid",SystemPropsUtil.pid);
        paraMap.put("sign", SignMD5Util.getSignStr(paraMap,SystemPropsUtil.appSecret));
        String jsonString = HttpUtils.sendGet(SystemPropsUtil.getTop100, paraMap);
        if (!jsonString.contains("成功")){
            return "";
        }
        JSONObject jsonObject = JSON.parseObject(jsonString);
        String data = jsonObject.getString("data");
        JSONObject jsonObject1 = JSON.parseObject(data);
        String hotWords = jsonObject1.getString("hotWords");
        return hotWords;
    }

    /**
     *  关键字商品搜索
     * @param search
     * @param sort
     * @return
     */
    @Override
    public String SendDaTaoKeListSuperGoods(String search, Integer pageId, Integer pageSize, String sort) throws UnsupportedEncodingException {
        TreeMap<String,Object> paraMap = new TreeMap<String,Object>();
        paraMap.put("appKey",SystemPropsUtil.appKey);
        paraMap.put("version","v1.2.1");
        paraMap.put("type",0);
        paraMap.put("pageId",pageId);
        paraMap.put("pageSize",pageSize);
        paraMap.put("keyWords",search);
        paraMap.put("sort",sort);
        paraMap.put("pid",SystemPropsUtil.pid);
        paraMap.put("sign", SignMD5Util.getSignStr(paraMap,SystemPropsUtil.appSecret));
        String jsonString = HttpUtils.sendGet(SystemPropsUtil.listSuperGoods, paraMap);
        return jsonString;
    }

    /**
     * 猜你喜欢
     * @param id
     * @param size
     * @return
     */
    @Override
    public String SendDaTaoKeByOpen(Long id, int size) throws UnsupportedEncodingException {
        TreeMap<String,Object> paraMap = new TreeMap<String,Object>();
        paraMap.put("appKey",SystemPropsUtil.appKey);
        paraMap.put("version","v1.1.1");
        paraMap.put("size",size);
        paraMap.put("id",id);
        paraMap.put("pid",SystemPropsUtil.pid);
        paraMap.put("sign", SignMD5Util.getSignStr(paraMap,SystemPropsUtil.appSecret));
        String jsonString = HttpUtils.sendGet(SystemPropsUtil.byopen, paraMap);
        return jsonString;
    }

    /**
     * 九块九包邮商品获取
     * @return
     */
    @Override
    public String SendDaTaoKeNinePriceOPen(Integer pageSize,String pageId,String nineCid) throws UnsupportedEncodingException {
        TreeMap<String,Object> paraMap = new TreeMap<String,Object>();
        paraMap.put("appKey",SystemPropsUtil.appKey);
        paraMap.put("version","v1.1.0");
        paraMap.put("pageSize",pageSize);
        paraMap.put("pageId",pageId);
        paraMap.put("nineCid",nineCid);
        paraMap.put("pid",SystemPropsUtil.pid);
        paraMap.put("sign", SignMD5Util.getSignStr(paraMap,SystemPropsUtil.appSecret));
        String jsonString = HttpUtils.sendGet(SystemPropsUtil.opgoods, paraMap);
        return jsonString;
    }

    /**
     * 精彩专辑
     * @return
     */
    @Override
    public String SendDaTaoKeCatalogue() throws UnsupportedEncodingException {
        TreeMap<String,Object> paraMap = new TreeMap<String,Object>();
        paraMap.put("appKey",SystemPropsUtil.appKey);
        paraMap.put("version","v1.1.0");
        paraMap.put("pid",SystemPropsUtil.pid);
        paraMap.put("sign", SignMD5Util.getSignStr(paraMap,SystemPropsUtil.appSecret));
        String jsonString = HttpUtils.sendGet(SystemPropsUtil.catalogue, paraMap);
        return jsonString;
    }

    /**
     * 获取官方活动
     * @return
     */
    @Override
    public String senDaTaoKetbTopic(Integer pageSize,String pageId,Integer type) throws UnsupportedEncodingException {
        TreeMap<String,Object> paraMap = new TreeMap<String,Object>();
        paraMap.put("appKey",SystemPropsUtil.appKey);
        paraMap.put("version","v1.2.0");
        paraMap.put("pageSize",pageSize);
        paraMap.put("pageId",pageId);
        paraMap.put("type",type);
        paraMap.put("pid",SystemPropsUtil.pid);
        paraMap.put("sign", SignMD5Util.getSignStr(paraMap,SystemPropsUtil.appSecret));
        String jsonString = HttpUtils.sendGet(SystemPropsUtil.tbTopic, paraMap);
        return jsonString;
    }

    /**
     * 各大榜单
     * @param rankType
     * @return
     */
    @Override
    public String senDaTaoKetbrankingList(Integer rankType) {
        return null;
    }

    /**
     * 超级分类
     * @return
     */
    @Override
    public String SendDaTaoKeCategory() throws UnsupportedEncodingException {
        TreeMap<String,Object> paraMap = new TreeMap<String,Object>();
        paraMap.put("appKey",SystemPropsUtil.appKey);
        paraMap.put("version","v1.1.0");
        paraMap.put("pid",SystemPropsUtil.pid);
        paraMap.put("sign", SignMD5Util.getSignStr(paraMap,SystemPropsUtil.appSecret));
        String jsonString = HttpUtils.sendGet(SystemPropsUtil.category, paraMap);
        return jsonString;
    }

    /**
     * 限时抢购
     * @param creatData
     * @return
     */
    @Override
    public String senDaTaoKeflashSale(String creatData) {
        TreeMap<String,Object> paraMap = new TreeMap<String,Object>();
        paraMap.put("appKey",SystemPropsUtil.appKey);
        paraMap.put("version","v1.2.0");
//        paraMap.put("roundTime",creatData);
        paraMap.put("pid",SystemPropsUtil.pid);
        paraMap.put("sign", SignMD5Util.getSignStr(paraMap,SystemPropsUtil.appSecret));
        String jsonString = null;
        try {
            jsonString = HttpUtils.sendGet(SystemPropsUtil.flashSale, paraMap);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonString;
    }

    /**
     * 各大榜单 默认提取实时榜单
     * @return
     */
    @Override
    public String SendDaTaoKeHotcatalogue(Integer num) {
        TreeMap<String,Object> paraMap = new TreeMap<String,Object>();
        paraMap.put("appKey",SystemPropsUtil.appKey);
        paraMap.put("version","v1.2.2");
        paraMap.put("rankType",num);
        paraMap.put("pid",SystemPropsUtil.pid);
        paraMap.put("sign", SignMD5Util.getSignStr(paraMap,SystemPropsUtil.appSecret));
        String jsonString = null;
        try {
            jsonString = HttpUtils.sendGet(SystemPropsUtil.rankingList, paraMap);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return jsonString;
    }

//    public String sendGet(String getUrl, Map<String, String> paraMap){
//        if(paraMap == null){
//            paraMap = new HashMap<String,String>();
//        }
//        paraMap= new TreeMap<String,String>(paraMap);
//        StringBuilder sb = new StringBuilder();
//        paraMap.entrySet().stream().forEach(entry ->{
//            sb.append(entry.getKey());
//            sb.append("=");
//            sb.append(entry.getValue());
//            sb.append("&");
//        });
//        getUrl = getUrl.contains("?")?getUrl:getUrl+"?";
//        return HttpUtils.doGet(getUrl+sb.toString());
//    }
}
