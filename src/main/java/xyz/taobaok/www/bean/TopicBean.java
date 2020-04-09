package xyz.taobaok.www.bean;

import lombok.Data;

/**
 * @Author weiranliu
 * @Email liuweiran12138@outlook.com
 * @Date 2020/4/3   6:29 下午
 * @Version 1.0
 */
@Data
public class TopicBean {
    private Integer id;					//活动id	Number	1
    private String activityName;			//活动名称	String	“聚划算-日常-品牌清仓”
    private String activityStartTime;	//活动开始时间	String	“2020-03-02 00:00:00”
    private String activityEndTime;		//活动结束时间	String	“2020-03-31 23:59:59”
    private String activityInfo;			//活动信息	String	清仓info
    private Integer type;				//端口类型	Number	1
    private String activityLink;		//活动链接	String	https://
    private String materialLink;		//素材链接	String	“https://gw.alicdn.com/tfs/TB1iUMatQP2gK0jSZPxXXacQpXa-440-180.jpg“
}
