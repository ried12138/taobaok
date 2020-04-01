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
import xyz.taobaok.www.dataokeapi.Service.DataokeService;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ViewController extends BeanController {

    @Autowired
    DataokeService dataokeService;
//    @Autowired
//    DataokeDao dataokeDao;

    //首页访问
    @RequestMapping(value = "/index",method = RequestMethod.GET)
    public String ViewIndex(){
//        Username query = dataokeDao.query();
        return "views/home";
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
        List<String> hotword = (List<String>) session.getAttribute("hotword");
        if (hotword==null){
            String hotWords = dataokeService.SendDaTaoKeApiTop();
            List<String> strings = JSONObject.parseObject(hotWords, List.class);
            List<String> list = strings.subList(0, 19);
            session.setAttribute("hotword",list);
            hotword = list;
        }
        //将list放到请求域里
        map.put("list",hotword);
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

}
