package xyz.taobaok.www.manager;

import com.alibaba.fastjson.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import xyz.taobaok.www.controller.WeixinPostRequestController;
import xyz.taobaok.www.dataokeapi.Service.DataokeService;
import xyz.taobaok.www.manager.dao.DataokeMapper;

import java.util.List;

/**
 * 定时任务，每天执行的拉取服务
 * @Author weiranliu
 * @Email liuweiran12138@outlook.com
 * @Date 2020/4/1   7:38 下午
 * @Version 1.0
 */
//@Service
public class TimingTaskDataoke {
//    private static Logger logger = LoggerFactory.getLogger(TimingTaskDataoke.class);
//    @Autowired
//    DataokeMapper dataokeMapper;
//    @Autowired
//    DataokeService dataokeService;
    /**
     * 获取热搜词
     */
//每天凌晨1点半执行      [秒] [分] [小时] [日] [月] [周] [年]
//    @Scheduled(cron = "0 1 * * * ?")
//    public void PulloutHotword(){
//        String hotWords = dataokeService.SendDaTaoKeApiTop();
//        int i = dataokeMapper.updateHotWord(hotWords);
//        if (i>=1){
//            logger.info("success hotword is ok!");
//        }
//    }

}
