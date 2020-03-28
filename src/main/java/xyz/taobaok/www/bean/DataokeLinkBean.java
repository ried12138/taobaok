package xyz.taobaok.www.bean;

import lombok.Data;

/**
 *
 * 大淘客商品转链封装对象
 * @Author weiranliu
 * @Email liuweiran12138@outlook.com
 * @Date 2020/3/28   11:32 下午
 * @Version 1.0
 */
@Data
public class DataokeLinkBean {
    private String couponClickUrl;				//商品优惠券推广链接			String	h
    private String couponEndTime;				//优惠券结束时间			String	2016-09-26
    private String couponInfo;					//优惠券面额				String	满16元减10元
    private String couponStartTime;				//优惠券开始时间			String	2016-09-25
    private Long itemId;						//商品id					Number	524136796550
    private Integer couponTotalCount;			//优惠券总量				Number	8000
    private Integer couponRemainCount;			//优惠券剩余量				Number	6859
    private String itemUrl;						//商品淘客链接				String	https://s.click.taobao.com/
    private String tpwd;						//淘口令					String	￥vpZTYeQ3RtO￥
    private float maxCommissionRate;			//佣金比例					Number	20
    private String shortUrl;					//短链接					String	https://s.click.taobao.com/xaulr5w
}
