package xyz.taobaok.www.bean;

import lombok.Data;

/**
 * 大淘客超级分类， 二级分类封装类
 * @Author weiranliu
 * @Email liuweiran12138@outlook.com
 * @Date 2020/4/7   11:49 上午
 * @Version 1.0
 */
@Data
public class SubcategoriesBean {
    private Integer subcid;	                        //二级分类Id，根据实际返回id为准	Number	98713
    private String subcname;	                        //二级分类名称	String	T恤/短袖
    private String scpic;	                        //二级分类图标	string	https://img.alicdn.com/imgextra/i1/2053469401/TB2oX82HL9TBuNjy0FcXXbeiFXa-2053469401.pngprivate String

}
