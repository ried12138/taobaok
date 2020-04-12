package xyz.taobaok.www.controller;


import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import xyz.taobaok.www.bean.*;
import xyz.taobaok.www.databaseServer.UserService;
import xyz.taobaok.www.dataokeapi.Service.DataokeService;
import xyz.taobaok.www.util.RandomNumUtil;

import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class ViewController extends BeanController {

    @Autowired
    DataokeService dataokeService;
    @Autowired
    UserService userService;

    //首页访问
    @ResponseBody
    @RequestMapping(value = "/index",method = RequestMethod.GET)
    public Object ViewIndex(){
        //精彩专辑
        ModelAndView modelAndView = new ModelAndView("views/home");
//        System.out.println(" //----------------------------测试代码--------------------------->>");

//        System.out.println("//<<---------------------------测试代码结束-------------------------");
        try {
            String json = dataokeService.senDaTaoKetbTopic(4,"1",2);
            if (!json.contains("成功")){

            }else{
                JSONObject jsonObject = JSON.parseObject(json);
                String data = jsonObject.getString("data");
                List<TopicBean> topicBean = JSONObject.parseArray(data, TopicBean.class);
                modelAndView.addObject("topicBean",topicBean);
            }
            //限时抢购封页
            SimpleDateFormat df = new SimpleDateFormat("HH");
            String date = df.format(new Date());
            date = date+":00:00";
//            creatData = URLEncoder.encode(creatData, "UTF-8");
//            String creatData = "2020-04-11 17:00:00";
            String jsondata = dataokeService.senDaTaoKeflashSale(date);
            if (!jsondata.contains("成功")){

            }else{
                JSONObject jsonObject = JSON.parseObject(jsondata);
                String data = jsonObject.getString("data");
                JSONObject jsonObject1 = JSON.parseObject(data);
                String goodsList = jsonObject1.getString("goodsList");
                List<FlashSaleShopBean> flashSaleBeans = JSONObject.parseArray(goodsList, FlashSaleShopBean.class);
                modelAndView.addObject("flashSale",flashSaleBeans);
                modelAndView.addObject("dateTime",date);
            }
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return modelAndView;
    }

    /**
     * 限时抢购
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/flashSale",method = RequestMethod.GET)
    public Object flashSale(){
        ModelAndView mode = new ModelAndView("flashSale");
        try {
            String jsondata = dataokeService.senDaTaoKeflashSale("");
            if (!jsondata.contains("成功")){
            }else{
                JSONObject jsonObject = JSON.parseObject(jsondata);
                String data = jsonObject.getString("data");
                JSONObject jsonObject1 = JSON.parseObject(data);
                String goodsList = jsonObject1.getString("goodsList");
                List<FlashSaleShopBean> flashSaleBeans = JSONObject.parseArray(goodsList, FlashSaleShopBean.class);
                mode.addObject("flashSale",flashSaleBeans);
                SimpleDateFormat df = new SimpleDateFormat("HH");
                String date = df.format(new Date());
                date = date+":00:00";
                mode.addObject("dateTime",date);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return mode;
    }
    /**
     * 首页推荐
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/Recommend",method = RequestMethod.POST)
    public Object Recommend(HttpSession session,String pageId){
        start();
            Object userinfo = session.getAttribute("userinfo");
            if (userinfo != null) {
                try {
                    //如果登陆账号，推荐为收藏夹的内容相关
                    UserDataBean user = (UserDataBean) userinfo;
                    List<UserBehaviorDataBean> userBehaviorDataBeans = userService.queryShopId(user.getId());
                    int size = userBehaviorDataBeans.size();
                    if (size != 0){
                        Random rand = new Random();
                        int i = rand.nextInt(size - 1);
                        if (i >= 0){
                            UserBehaviorDataBean userBehaviorDataBean = userBehaviorDataBeans.get(i);
                            String collectionId = userBehaviorDataBean.getCollectionId();
                            String item = dataokeService.SendDaTaoKeByOpen(Long.valueOf(collectionId), 20);
                            if (item.contains("成功")){
                                JSONObject jsonObject1 = JSONObject.parseObject(item);
                                String data1 = jsonObject1.getString("data");
                                List<ItemBean> itemBeans = JSONObject.parseArray(data1, ItemBean.class);
                                data(itemBeans);
                                success(true);
                                return end();
                            }
                        }
                    }
                    Object object = hotRecommend(pageId);
                    if (object !=null){
                        List<ShopListBean> shopList = (List<ShopListBean>) object;
                        success(true);
                        data(shopList);
                    }else{
                        success(false);
                        message("获取商品失败，请重试");
                    }
                } catch (UnsupportedEncodingException e) {
                    e.printStackTrace();
                }
            }else{
//                    //如果没有登陆推荐热搜词的相关内容
//                    Integer integer = Integer.valueOf(pageId);
//                    String hotWords = dataokeService.SendDaTaoKeApiTop();
//                    List<String> hots = JSONObject.parseObject(hotWords, List.class);
//                    String s = RandomNumUtil.RandomNum(2);
//                    Integer num = Integer.valueOf(s);
//                    String hot = hots.get(num);
//                    String jsonString = dataokeService.SendDaTaoKeListSuperGoods(hot, integer, 40, "total_sales_des");
//                    if (!jsonString.contains("成功")){
//                        success(false);
//                        message("获取商品失败，请重试");
//                        return end();
//                    }
//                    JSONObject jsonObject = JSON.parseObject(jsonString);
//                    String data = jsonObject.getString("data");
//                    JSONObject jsonObject1 = JSON.parseObject(data);
//                    String list= jsonObject1.getString("list");
//                    List<ShopListBean> shopList = JSONObject.parseArray(list, ShopListBean.class);
                    Object object = hotRecommend(pageId);
                    if (object !=null){
                        List<ShopListBean> shopList = (List<ShopListBean>) object;
                        success(true);
                        data(shopList);
                    }else{
                        success(false);
                        message("获取商品失败，请重试");
                    }
            }
            return end();
    }

        /**
     * 超级分类
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/category",method = RequestMethod.GET)
    public Object category(){
        ModelAndView modelAndView = new ModelAndView("shoptype");
        try {
            String shoptype = dataokeService.SendDaTaoKeCategory();
            if (shoptype.contains("成功")){
                JSONObject jsonObject = JSON.parseObject(shoptype);
                String data = jsonObject.getString("data");
                List<ShopTypeBean> shopTypeBeans = JSONObject.parseArray(data, ShopTypeBean.class);
                modelAndView.addObject("shoptype",shopTypeBeans);
            }
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return modelAndView;
    }
    //精彩专辑
    @ResponseBody
    @RequestMapping(value = "/Catalogue",method = RequestMethod.POST)
    public Object Catalogue(){
        //拉去精彩专辑
        start();
        try {
            String json = dataokeService.SendDaTaoKeCatalogue();
            JSONObject jsonObject = JSON.parseObject(json);
            String data = jsonObject.getString("data");
            List<CatalogueBean> catalogueBeans = JSONObject.parseArray(data, CatalogueBean.class);
            success(true);
            data(catalogueBeans);
        } catch (Exception e) {
           success(false);
           message("拉取精彩专辑失败");
        }
        return end();
    }
    /**
     *  商品详情页
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/item",method = RequestMethod.GET)
    public Object item(String id){
        String item ="";
        ModelAndView modelAndView=null;
        Map<String, Object> byopen = null;
        List<ItemBean> itemBean = null;
        start();
        try {
            //获取商品详情页
            item = dataokeService.SenDaTaoKeApiGoods(id);
            if (!item.contains("成功")){
                success(false);
                message("拉去商品详情失败，请联系管理员");
            }else{
                JSONObject jsonObject = JSONObject.parseObject(item);
                String data = jsonObject.getString("data");
                ItemBean list = JSONObject.parseObject(data, ItemBean.class);
                String s = list.getImgs().get(0);
                String[] split = s.split(",");
                List<String> imgs = new ArrayList<>();
                for (String s1 : split) {
                    imgs.add(s1);
                }
                list.setImgs(imgs);
                //猜你喜欢
                byopen = new HashMap<String,Object>();
                item = dataokeService.SendDaTaoKeByOpen(list.getId(),4);
                if (item.contains("成功")){
                    JSONObject jsonObject1 = JSONObject.parseObject(item);
                    String data1 = jsonObject1.getString("data");
                    itemBean = JSONObject.parseArray(data1, ItemBean.class);
                    byopen.put("itemBean",itemBean);
                }else{

                }
                data(list);
                success(true);
            }
            //携带参数跳转xqitem页面
            modelAndView = new ModelAndView("xqitem/xqitem", (Map<String,?>) end());
            modelAndView.addAllObjects(byopen);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return modelAndView;
    }

    /**
     * 搜索页
     *  这里的代码要修改，因为每次都要获取热词，设置全天只取得一次热词
     *  或直接改成定时任务，每天只去一次
     *  注：2020/03/27
     * @return
     */
    @RequestMapping(value = "/search",method = RequestMethod.GET)
    public String searchIndex(Map<String,Object> map,HttpSession session){
        try {
            List<String> hotword = (List<String>) session.getAttribute("hotword");
            if (hotword==null){
                String hotWords = dataokeService.SendDaTaoKeApiTop();
                List<String> strings = JSONObject.parseObject(hotWords, List.class);
                session.setAttribute("hotword",strings);
                hotword = strings;
            }
            String s = RandomNumUtil.RandomNum(2);
            Integer integer = Integer.valueOf(s);
            if (integer < 70){
                hotword = hotword.subList(integer,integer+20);
            }else{
                hotword = hotword.subList(integer-20,integer);
            }
            //将list放到请求域里
            map.put("list",hotword);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        //获取热词top100
        return "search/search";
    }

    /**
     * 获取商品关键字
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/Word",method = RequestMethod.POST)
    public Object Word(String search, String placeholder, String hotword){
        start();
        try {
            if (hotword!=null){
                //热搜词
                data(hotword);
            }else if (!search.equals("")){
                //指定词
                data(search);
            }else{
                //默认词
                data(placeholder);
            }
            success(true);//成功
            message("成功");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return end();
    }
    /**
     * 关键字搜索 支持get
     * @param wordName
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/shoplists",method = RequestMethod.GET)
    public Object searchWord(String wordName){
        ModelAndView mode = new ModelAndView("shoplist");
        mode.addObject("wordName",wordName);
        return mode;
    }

    /**
     * 关键字搜索 支持post
     * @param wordName
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/shoplist",method = RequestMethod.POST)
    public Object searchWord(String wordName,Integer pageId,Integer pageSize,String sort,HttpSession session){
        start();
        String jsonString = "";
        try {
            if (sort.equals("sort")){
                sort = (String) session.getAttribute("sort");
            }else{
                session.setAttribute("sort",sort);          //排序格式
            }

            if (sort.equals("default") || sort.equals("sort")){
                sort = "";
            }
            jsonString = dataokeService.SendDaTaoKeListSuperGoods(wordName,pageId,pageSize,sort);
            if (!jsonString.contains("成功")){
                success(false);
                message("获取商品失败，请重试");
                return end();
            }
            JSONObject jsonObject = JSON.parseObject(jsonString);
            String data = jsonObject.getString("data");
            JSONObject jsonObject1 = JSON.parseObject(data);
            String list= jsonObject1.getString("list");
            List<ShopListBean> shopList = JSONObject.parseArray(list, ShopListBean.class);
            success(true);
            message(wordName);
            data(shopList);
            //将最近搜索过的词放到session域中recentSearch
            List<String> recentSearch = (List<String>) session.getAttribute("recentSearch");
            if(recentSearch != null){
                if (!recentSearch.contains(wordName)){
                    if (recentSearch.size() == 9){
                        recentSearch.remove(0);
                    }
                    recentSearch.add(wordName);
                    session.setAttribute("wordName",wordName);      //当前搜索词
                    session.setAttribute("recentSearch",recentSearch);//最近搜索搜词
//                    session.setAttribute("sort",sort);          //排序格式
                }
            }else {
                List<String> strings = new ArrayList<>();
                strings.add(wordName);
                recentSearch = strings;
                session.setAttribute("recentSearch",recentSearch);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return end();
    }

    /**
     * 清除最近搜索记录
     * @param session
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/delword",method = RequestMethod.GET)
    public Object getDelword(HttpSession session){
        start();
        try {
            session.removeAttribute("recentSearch");
            message("最近搜索记录删除成功");
            success(true);
        } catch (Exception e) {
            message("最近搜索记录删除失败,请联系管理员");
            success(false);
            e.printStackTrace();
        }
        return end();
    }

    /**
     *  商品生成短链接(推广链接)
     * @param goodsId
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/getbuy", method = RequestMethod.POST)
    public Object getbuy(String goodsId){
        start();
        try {
            String jsonString = dataokeService.senDaTaoKeApiLink(goodsId);
            if (!jsonString.contains("成功")){
                message("购买请求失败，请联系管理员");
                success(false);
                return end();
            }

            JSONObject jsonObject = JSONObject.parseObject(jsonString);
            String list = jsonObject.getString("data");
            DataokeLinkBean dataokeLinkBean = JSONObject.parseObject(list, DataokeLinkBean.class);
            success(true);
            data(dataokeLinkBean);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return end();
    }

    /**
     * 跳转9.9包邮
     * @return
     */
    @RequestMapping(value = "/jiukuaijiulist",method = RequestMethod.GET)
    public String jiukuaijiulist(){
        return "jiukuaijiulist";
    }


    /**
     * 返回9.9包邮数据
     * @param pageSize
     * @param pageId
     * @param nineCid
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/jiukuaijiulist",method = RequestMethod.POST)
    public Object jiukuaijiulist(Integer pageSize,String pageId,String nineCid){
        start();
        try {
            String json = dataokeService.SendDaTaoKeNinePriceOPen(pageSize, pageId, nineCid);
            if (!json.contains("成功")){
                message("九块九包邮模块数据请求失败，请联系管理员");
                success(false);
                return end();
            }
            JSONObject jsonObject = JSON.parseObject(json);
            String data = jsonObject.getString("data");
            JSONObject jsonObject1 = JSON.parseObject(data);
            String list= jsonObject1.getString("list");
            List<ShopListBean> shopList = JSONObject.parseArray(list, ShopListBean.class);
            success(true);
            data(shopList);
        } catch (Exception e) {
            message("九块九包邮模块数据请求异常，请联系管理员");
            success(false);
            return end();
        }
        return end();
    }




    //首页推荐方法
    private Object hotRecommend(String pageId){
        try {
            //如果没有登陆推荐热搜词的相关内容
            Integer integer = Integer.valueOf(pageId);
            String hotWords = dataokeService.SendDaTaoKeApiTop();
            List<String> hots = JSONObject.parseObject(hotWords, List.class);
            String s = RandomNumUtil.RandomNum(2);
            Integer num = Integer.valueOf(s);
            String hot = hots.get(num);
            String jsonString = dataokeService.SendDaTaoKeListSuperGoods(hot, integer, 40, "total_sales_des");
            if (!jsonString.contains("成功")){
                return null;
            }
            JSONObject jsonObject = JSON.parseObject(jsonString);
            String data = jsonObject.getString("data");
            JSONObject jsonObject1 = JSON.parseObject(data);
            String list= jsonObject1.getString("list");
            List<ShopListBean> shopList = JSONObject.parseArray(list, ShopListBean.class);
            return shopList;
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return null;
    }
}
