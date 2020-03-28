package xyz.taobaok.www.bean;

import lombok.Data;

import java.util.List;

/**
 * 大淘客商品详情页封装对象
 *
 * @Author weiranliu
 * @Email liuweiran12138@outlook.com
 * @Date 2020/3/27   5:29 下午
 * @Version 1.0
 */
@Data
public class ItemBean {
    private Integer id;	    				//商品id,若查询结果id=-1，则说明该商品非大淘客平台商品，数据为淘宝直接返回的数据，由于淘宝数据的缓存时间相对较长，会出现商品信息和详情信息不一致的情况	Number	18926311
    private String goodsId;					//淘宝商品id															String	“589284195570”
    private String itemLink;				//商品淘宝链接														String	“https://detail.tmall.com/item.htm?id=589284195570“
    private String title;					//淘宝标题															String	“西维里男士睡衣夏季韩版真丝短袖丝绸薄款宽松青年冰丝家居服套装”
    private String dtitle;					//大淘客短标题														String	“夏季睡衣男冰丝短袖丝绸家居服套装”
    private String desc;					//推广文案															String	“宽松舒适，难以磨损典，雅而优美，倍感丝滑，质感优越，庄严而心仪，简约设计，色调清新脱俗，适合各种场合”
    private Integer cid;					//商品在大淘客的分类id													Number	10
    private List<Integer> subcid;			//商品在大淘客的二级分类id，该分类为前端分类，一个商品可能有多个二级分类id	List[Number]	[86369,90723]
    private Integer tbcid;					//商品在淘宝的分类id													Number	50012772
    private String mainPic;					//商品主图链接														String	“//img.alicdn.com/imgextra/i2/4014489195/O1CN01kYlVPs2HnMKYwLLRm_!!4014489195.jpg”
    private String marketingMainPic;		//营销主图链接														String	“https://sr.ffquan.com/super_pic/o_1d6fpckjs1ii3h9dkibk9b7h38.jpg“
    private Integer originalPrice;			//商品原价															Number	38.5
    private Integer actualPrice;			//券后价																number	28.5
    private Integer discounts;				//折扣力度															Number	0.74
    private Integer commissionType;			//佣金类型，0-通用，1-定向，2-高佣，3-营销计划							number	3
    private Integer commissionRate;			//佣金比例															Number	20
    private String couponLink;				//优惠券链接															String	“https://uland.taobao.com/quan/detail?sellerId=4“
    private Integer couponTotalNum;			//券总量																Number	7000
    private Integer couponReceiveNum;		//领券量																Number	1000
    private String couponEndTime;			//优惠券结束时间														String	“2019-04-08 23:59:59”
    private String couponStartTime;			//优惠券开始时间														String	“2019-04-01 00:00:00”
    private Integer couponPrice;			//优惠券金额															Number	10
    private String couponConditions;		//优惠券使用条件														String	“38”
    private Integer monthSales;				//30天销量															Number	1030
    private Integer twoHoursSales;			//2小时销量															Number	30
    private Integer dailySales;				//当天销量															Number	49
    private Integer brand;					//是否是品牌商品														Number	4
    private Long brandId;				    //品牌id																Number	2301323020
    private String brandName;				//品牌名称															String	“西维里”
    private String createTime;				//商品上架时间														String	“2019-03-29 10:00:06”
    private Integer tchaoshi;				//是否天猫超市商品，1-天猫超市商品，0-非天猫超市商品						Number	0
    private Integer activityType;			//活动类型，1-无活动，2-淘抢购，3-聚划算									Number	1
    private String activityStartTime;		//活动开始时间														String	“2019-03-29 10:00:06”
    private String activityEndTime;			//活动结束时间														String	“2019-04-29 10:00:06”
    private Integer shopType;				//店铺类型，1-天猫，0-淘宝												Number	1
    private Integer goldSellers;			//是否金牌卖家，1-金牌卖家，0-非金牌卖家									Number	0
    private Integer haitao;					//是否海淘，1-海淘商品，0-非海淘商品										Number	0
    private String sellerId;				//淘宝卖家id															String	“4014489195”
    private String shopName;				//店铺名称															String	“西维里旗舰店”
    private Integer shopLevel;				//淘宝店铺等级														Number	11
    private Integer descScore;				//描述分																Number	4.8
    private Integer dsrScore;				//描述相符															Number	4.8
    private Integer dsrPercent;				//描述同行比															Number	0.0
    private Integer shipScore;				//物流服务															Number	4.8
    private Integer shipPercent;			//物流同行比															Number	10.32
    private Integer serviceScore;			//服务态度															Number	4.8
    private Integer servicePercent;			//服务同行比															Number	5.82
    private Integer hotPush;				//热推值																Number	456
    private String teamName;				//放单人名称															String	“啊甘团队”
    private List<String> detailPics;		//商品主图（需要做适配）												Array	[{“img”: “//img.alicdn.com/imgextra/i2/2099112387/O1CN015iPsj11TVHwGWKgLO!!2099112387.jpg”}, {“img”: “//img.alicdn.com/imgextra/
    private List<String> imgs;				//淘宝轮播图															Array
    private List<String> reimgs;			//相关商品图															Array
    private Integer quanMLink;				//定金，若无定金，则显示0												Number	10
    private Integer hzQuanOver;				//立减，若无立减金额，则显示0											Number	100
    private Integer yunfeixian;				//0.不包运费险 1.包运费险												Number	1
    private Integer estimateAmount;			//预估淘礼金															Number	25.2
    private String shopLogo;				//店铺logo															String	https://img.alicdn.com/imgextra//59/df/TB1lJVxNFXXXXcoXFXXSutbFXXX.jpg
    private String specialText;				//商品卖点															List
}
