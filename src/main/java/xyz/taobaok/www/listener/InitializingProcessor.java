package xyz.taobaok.www.listener;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;
import xyz.taobaok.www.util.SystemPropsUtil;

/**
 * 项目启动夹在类
 */
@Component
public class InitializingProcessor implements ApplicationListener<ContextRefreshedEvent> {

    private static Logger logger = LoggerFactory.getLogger(InitializingProcessor.class);

    /**
     * 初始化系统
     * @param contextRefreshedEvent
     */
    @Override
    public void onApplicationEvent(ContextRefreshedEvent contextRefreshedEvent) {
        if (null == contextRefreshedEvent.getApplicationContext().getParent()) {
            SystemPropsUtil.init();
            logger.info("系统初始化完成");
        }
    }
}
