package xyz.taobaok.www.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 代理拼多多的多多进宝 api
 */
@Controller
public class DuoDuoJinBaoRequestController {

    @RequestMapping(value = "/wechat",method = RequestMethod.GET)
    @ResponseBody
    public void RequestGetDuoduojinbaoApi(HttpServletRequest request, HttpServletResponse response){
//        String clientId = "your clientId";
//        String clientSecret = "your clientSecret";
//        PopClient client = new PopHttpClient(clientId, clientSecret);
//
//        PddDdkGoodsPromotionUrlGenerateRequest request = new PddDdkGoodsPromotionUrlGenerateRequest();
//        request.setPId("str");
//        List<Long> goodsIdList = new ArrayList<Long>();
//        goodsIdList.add(0L);
//        request.setGoodsIdList(goodsIdList);
//        request.setGenerateShortUrl(false);
//        request.setMultiGroup(false);
//        request.setCustomParameters("str");
//        request.setGenerateWeappWebview(false);
//        request.setZsDuoId(0L);
//        request.setGenerateWeApp(false);
//        request.setGenerateWeiboappWebview(false);
//        request.setGenerateMallCollectCoupon(false);
//        request.setGenerateSchemaUrl(false);
//        request.setGenerateQqApp(false);
//        request.setSearchId("str");
//        PddDdkGoodsPromotionUrlGenerateResponse response = client.syncInvoke(request);
//        System.out.println(JsonUtil.transferToJson(response));
    }
}
