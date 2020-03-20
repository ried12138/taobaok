package xyz.taobaok.www.util.dataoke;

import lombok.Data;

@Data
public class Dataa {

    private String couponClickUrl;          //商品优惠券推广链接
    private String couponEndTime;           //优惠券结束时间
    private String couponInfo;              //优惠券面额
    private String couponStartTime;         //优惠券开始时间
    private String itemId;                  //商品id
    private String couponTotalCount;        //优惠券总量
    private String couponRemainCount;       //优惠券剩余量
    private String itemUrl;                 //淘宝客链接
    private String tpwd;                    //淘口令
    private String maxCommissionRate;       //佣金比例
    private String shortUrl;                //短链接
}
