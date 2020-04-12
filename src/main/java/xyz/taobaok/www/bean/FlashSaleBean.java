package xyz.taobaok.www.bean;

import lombok.Data;

import java.util.List;

/**
 * 限时抢购封装类
 * @Author weiranliu
 * @Email liuweiran12138@outlook.com
 * @Date 2020/4/11   9:13 下午
 * @Version 1.0
 */
@Data
public class FlashSaleBean {
    private String ddqTime;	                                         //场次时间	String	2019-12-10 08:00:00
    private Integer status;	                                             //商品id	Number	18926311
    private List<FlashSaleShopBean> goodsList;                       //商品信息
}
