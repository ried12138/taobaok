package xyz.taobaok.www.util;


import jodd.props.Props;
import lombok.Data;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import java.io.File;
import java.io.IOException;
import java.net.URISyntaxException;

/**
 *  大淘客配置文件读取
 * @author liuweiran
 */
@Component
@Data
public class PropertiesUtil {
    private static final Logger logger = LoggerFactory.getLogger(PropertiesUtil.class);

    //获取配置文件内容
    public static Props getInstance(String resourceName)
    {
        Props props = new Props();
        try {
            String path = PropertiesUtil.class.getResource(resourceName).toURI().getPath();
            props.load(new File(path), "UTF-8");
        } catch (URISyntaxException e) {
            logger.error("文件路径解析异常:{}", e.getMessage());
        } catch (IOException e) {
            logger.error("读取资源文件异常:{}", e.getMessage());
        }
        return props;
    }
}
