package xyz.taobaok.www.controller;


import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.google.gson.JsonObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import xyz.taobaok.www.bean.BeanController;
import xyz.taobaok.www.bean.DataokeLinkBean;
import xyz.taobaok.www.bean.ItemBean;
import xyz.taobaok.www.bean.ShopListBean;
import xyz.taobaok.www.dataokeService.DataokeService;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ViewController extends BeanController {

    @Autowired
    DataokeService dataokeService;

    //首页访问
    @RequestMapping(value = "/index",method = RequestMethod.GET)
    public String ViewIndex(){
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
                List<String> reimgs = list.getReimgs();
                data(list);
                success(true);
            }
            //携带参数跳转xqitem页面
            modelAndView = new ModelAndView("xqitem/xqitem", (Map<String,?>) end());
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
        String hotWords = dataokeService.SendDaTaoKeApiTop();
        List<String> strings = JSONObject.parseObject(hotWords, List.class);
        List<String> list = strings.subList(0, 19);
        //将list放到请求域里
        map.put("list",list);
        //获取热词top100
        return "search/search";
    }

    /**
     * 获取商品关键字
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/Word",method = RequestMethod.POST)
    public Object Word(String search, String placeholder, String hotword,HttpSession session){
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
     * 关键字搜索
     * @param wordName
     * @return
     */
    @RequestMapping(value = "/shoplist",method = RequestMethod.GET)
    public Object searchWord(String wordName){
        start();
        ModelAndView mode = null;
        String jsonString = "";
        Map<String,Object> map = new HashMap<String,Object>();
        try {
            jsonString = dataokeService.SendDaTaoKeListSuperGoods(wordName);
            if (!jsonString.contains("成功")){
                success(false);
                message("获取商品失败，请联系管理员");
                return end();
            }
            JSONObject jsonObject = JSON.parseObject(jsonString);
            String data = jsonObject.getString("data");
            JSONObject jsonObject1 = JSON.parseObject(data);
            String list= jsonObject1.getString("list");
            List<ShopListBean> shopList = JSONObject.parseArray(list, ShopListBean.class);
            success(true);
            data(shopList);
            mode = new ModelAndView("shoplist");
            mode.addObject("wordName",wordName);
            mode.addObject("shop",shopList);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return mode;
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
