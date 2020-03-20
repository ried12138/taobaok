package xyz.taobaok.www.util.dataoke;


import com.alibaba.fastjson.annotation.JSONField;
import lombok.Data;

//大淘客响应json转对象封装
@Data
public class DaTaoKeJsonToObjectResponse {
    private long time;
    private Integer code;
    private String msg;
    @JSONField(name ="data")
    private Dataa data;

}
