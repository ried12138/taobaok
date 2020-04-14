package xyz.taobaok.www.bean;

import lombok.Data;

import java.math.BigDecimal;

/**
 * 各大榜单封装类
 * @Author weiranliu
 * @Email liuweiran12138@outlook.com
 * @Date 2020/4/14   4:23 下午
 * @Version 1.0
 */
@Data
public class RankingListBean {
    private String id;								//商品id，在大淘客的商品id	Number	19259135
    private Long goodsId;							//淘宝商品id	Number	590858626868
    private Integer ranking;						//榜单名次	Number	1
    private Integer newRankingGoods;				//是否新上榜商品（12小时内入榜的商品） 0.否1.是	Number	1
    private String dtitle;							//短标题	String	【李佳琦推荐】奢华芯肌素颜爆水霜
    private BigDecimal actualPrice;					//券后价	Number	39.9
    private String commissionRate;					//佣金比例	Number	30
    private BigDecimal couponPrice;					//优惠券金额	Number	300
    private Integer couponReceiveNum;				//领券量	Number	4000
    private Integer couponTotalNum;					//券总量	Number	100000
    private Integer monthSales;						//月销量	Number	8824
    private Integer twoHoursSales;					//2小时销量	Number	1138
    private Integer dailySales;						//当天销量	Number	389
    private Integer hotPush;						//热推值	Number	42
    private String mainPic;							//商品图	String	“https://img.alicdn.com/i4/1687451966/O1CN01rTeKnv1QOTBnyOXDe\_!!1687451966.jpg“
    private String title;							//商品长标题	String	“2019新款运动短裤女宽松防走光韩版外穿ins潮休闲学生bf夏季阔腿”
    private String desc;							//商品描述	String	“多款可选！显瘦高腰韩版阔腿裤五分裤，不起球，不掉色。舒适面料，不挑身材，高腰设计”
    private BigDecimal originalPrice;				//商品原价	Number	22.9
    private String couponLink;						//优惠券链接	String	“https://uland.taobao.com/quan/
    private String couponStartTime;					//优惠券开始时间	String	“2019-06-04 00:00:00”
    private String couponEndTime;					//优惠券结束时间	String	“2019-06-06 23:59:59”
    private Integer commissionType;					//佣金类型	Number	3
    private String createTime;						//创建时间	String	“2019-06-03 17:55:18”
    private Integer activityType;					//活动类型	Number	1
    private String picList;							//营销图	Array	“https://img.alicdn.com/imgextra/87451966/O1CN01h2ih4v1QOTCOxlZDj_!!1687451966.jpg“
    private String guideName;						//放单人名称	String	易折网
    private Integer shopType;						//店铺类型	Number	1
    private BigDecimal couponConditions;			//优惠券使用条件	Number	22
    private Integer avgSales;						//日均销量（仅复购榜返回该字段）	Number
    private String entryTime;						//入榜时间（仅复购榜返回该字段）	String
    private String sellerId;						//淘宝卖家id	String	“4014489195”
    private BigDecimal quanMLink;					//定金，若无定金，则显示0	Number	10
    private BigDecimal hzQuanOver;					//立减，若无立减金额，则显示0	Number	100
    private Integer yunfeixian;						//0.不包运费险 1.包运费险	Number	1
    private BigDecimal estimateAmount;				//预估淘礼金	Number	25.2
    private Integer freeshipRemoteDistrict;			//偏远地区包邮，0.不包邮，1.包邮	Number	1
}
