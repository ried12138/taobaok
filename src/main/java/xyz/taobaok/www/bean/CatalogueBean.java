package xyz.taobaok.www.bean;

import lombok.Data;

import java.util.List;

/**
 * 封装精选专辑
 * @Author weiranliu
 * @Email liuweiran12138@outlook.com
 * @Date 2020/4/3   4:23 下午
 * @Version 1.0
 */
@Data
public class CatalogueBean {
    private Integer topicId;	//活动ID	Number	32549
    private String topicName;	//活动名称	String	“双11定金预售”
    private String startTime;	//活动开始时间	Date	2019-10-22 11:00:00
    private String endTime;	    //活动结束时间	Date	2019-10-25 11:00:00
    private List<String> banner;	    //专辑活动banner
}
