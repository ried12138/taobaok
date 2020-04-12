package xyz.taobaok.www.bean;

import lombok.Data;

import java.math.BigDecimal;
import java.util.List;

/**
 * @Author weiranliu
 * @Email liuweiran12138@outlook.com
 * @Date 2020/4/11   9:17 下午
 * @Version 1.0
 */
@Data
public class FlashSaleShopBean {
    private Long id;											//商品id	Number	18926311
    private String goodsId;										//淘宝商品id	String	“589284195570”
    private String itemLink;									//商品淘宝链接	String	“https://detail.tmall.com/item.htm?id=589284195570“
    private String title;										//淘宝标题	String	“西维里男士睡衣夏季韩版真丝短袖丝绸薄款宽松青年冰丝家居服套装”
    private String dtitle;										//大淘客短标题	String	“夏季睡衣男冰丝短袖丝绸家居服套装”
    private Integer cid;										//商品在大淘客的分类id	Number	10
    private List<Integer> subcid;								//商品在大淘客的二级分类id，该分类为前端分类，一个商品可能有多个二级分类id	List[Number]	[86369,90723]
    private String ddqDesc;										//咚咚抢商品标签	String	除螨虫，更健康
    private Long tbcid;											//商品在淘宝的分类id	Number	50012772
    private String mainPic;										//商品主图链接	String	“img.alicdn.com/
    private BigDecimal originalPrice;								//商品原价	Number	38.5
    private BigDecimal actualPrice;									//券后价	Number	28.5
    private BigDecimal discounts;									//折扣力度	Number	0.74
    private Integer commissionType;								//佣金类型，0-通用，1-定向，2-高佣，3-营销计划	Number	3
    private Integer commissionRate;								//佣金比例	Number	20
    private String couponLink;									//优惠券链接	String	“ht
    private Integer couponTotalNum;								//券总量	Number	7000
    private Integer couponReceiveNum;							//领券量	Number	1000
    private String couponEndTime;								//优惠券结束时间	String	“2019-04-08 23:59:59”
    private String couponStartTime;								//优惠券开始时间	String	“2019-04-01 00:00:00”
    private BigDecimal couponPrice;									//优惠券金额	Number	10
    private String couponConditions;							//优惠券使用条件	String	“38”
    private Integer monthSales;									//30天销量	Number	1030
    private Integer twoHoursSales;								//2小时销量	Number	30
    private Integer dailySales;									//当日销量	Number	20
    private Integer brand;										//是否是品牌商品	Number	4
    private Long brandId;										//品牌id	Number	2301323020
    private String brandName;									//品牌名称	String	“西维里”
    private String createTime;									//商品上架时间	String	“2019-03-29 10:00:06”
    private Integer activityType;								//活动类型，1-无活动，2-淘抢购，3-聚划算	Number	1
    private String activityStartTime;							//活动开始时间	String	“2019-03-29 10:00:06”
    private String activityEndTime;								//活动结束时间	String	“2019-04-29 10:00:06”
    private String sellerId;									//淘宝卖家id	String	“4014489195”
    private String shopName;									//店铺名称	String	“西维里旗舰店”
    private Integer shopLevel;									//淘宝店铺等级	Number	11
    private Integer quanMLink;									//定金，若无定金，则显示0	Number	10
    private Integer hzQuanOver;									//立减，若无立减金额，则显示0	Number	100
    private Integer yunfeixian;									//0.不包运费险 1.包运费险	Number	1
    private Integer estimateAmount;								//预估淘礼金	Number	25.2
}
