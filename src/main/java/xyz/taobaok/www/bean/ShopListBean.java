package xyz.taobaok.www.bean;

import lombok.Data;

import java.math.BigDecimal;
import java.util.List;

//商品列表
@Data
public class ShopListBean {
    private Integer id;                   //商品id
    private String goodsId;               //淘宝商品id
    private String title;                 //淘宝标题
    private String dtitle;                //短标题
    private BigDecimal originalPrice;        //商品原价
    private BigDecimal actualPrice;          //券后价
    private Integer shopType;             //店铺类型，1-天猫，0-淘宝
    private Integer goldSellers;          //是否金牌卖家，1-金牌卖家，0-非金牌卖家
    private Integer monthSales;           //30天销量
    private Integer twoHoursSales;        //2小时销量
    private Integer commissionType;       //佣金类型，0-通用，1-定向，2-高佣，3-营销计划
    private String desc;                  //推广文案
    private Integer couponReceiveNum;     //领券量
    private String couponLink;            //优惠券链接
    private String couponEndTime;         //优惠券结束时间
    private String couponStartTime;       //优惠券开始时间
    private BigDecimal couponPrice;          //优惠券金额
    private String couponConditions;      //优惠券使用条件
    private Integer activityType;         //活动类型，1-无活动，2-淘抢购，3-聚划算
    private String createTime;            //商品上架时间
    private String mainPic;               //商品主图链接
    private String marketingMainPic;      //营销主图链接
    private String sellerId;              //淘宝卖家id
    private Integer cid;                  //商品在大淘客的分类id
    private List<Integer> subcid;         //商品在大淘客的二级分类id，该分类为前端分类，一个商品可能有多个二级分类id
    private Integer tbcid;                //商品在淘宝的分类id
    private BigDecimal discounts;            //折扣力度
    private Integer commissionRate;       //佣金比例
    private Integer couponTotalNum;       //券总量
    private Integer haitao;               //是否海淘,1-海淘商品，0-非海淘商品
    private String activityStartTime;     //活动开始时间
    private String activityEndTime;       //活动结束时间
    private String shopName;              //店铺名称
    private Integer shopLevel;            //淘宝店铺等级
    private Integer descScore;            //描述分
    private Integer dsrScore;             //描述相符
    private Integer dsrPercent;           //描述同行比
    private Integer shipScore;            //服务态度
    private Integer shipPercent;          //服务同行比
    private Integer serviceScore;         //物流服务
    private Integer servicePercent;       //物流同行比
    private Integer brand;                //是否是品牌商品
    private Long brandId;                 //品牌id
    private String brandName;             //品牌名称
    private Integer dailySales;           //当天销量
    private Integer hotPush;              //热推值
    private String teamName;              //放单人名称
    private String itemLink;              //商品淘宝链接
    private String tchaoshi;              //是否天猫超市商品，1-天猫超市商品，0-非天猫超市商品
    private Integer quanMLink;            //定金，若无定金，则显示0
    private Integer hzQuanOver;           //立减，若无立减金额，则显示0
    private Integer yunfeixian;           //0.不包运费险 1.包运费险
    private Integer estimateAmount;       //预估淘礼金
}