package xyz.taobaok.www.bean;


import java.util.HashMap;
import java.util.Map;

public class BeanController {
    private ThreadLocal<Map> threadLocal = new ThreadLocal<Map>();
        //开始封装
    public void start(){
        Map<String, Object> map = new HashMap<>();
        threadLocal.set(map);
    }
        //状态
    public void success(boolean success){
        threadLocal.get().put("success",success);
    }
        //消息
    public void message(String message){
        threadLocal.get().put("message",message);
    }
        //数据封装
    public void data(Object data){
        threadLocal.get().put("data",data);
    }
        //返回jsp页面的map
    public Object end(){
        return threadLocal.get();
    }
}
