package xyz.taobaok.www.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ViewController {


    //首页访问
    @RequestMapping(value = "/index",method = RequestMethod.GET)
    public String ViewIndex(){
        return "views/home";
    }

    /**
     *  商品详情页
     * @return
     */
    @RequestMapping(value = "/item",method = RequestMethod.GET)
    public String ViewIndexx(){
        return "xqitem/xqitem";
    }

    /**
     * 搜索页
     * @return
     */
    @RequestMapping(value = "/search",method = RequestMethod.GET)
    public String searchIndex(){

        return "search/search";
    }
}
