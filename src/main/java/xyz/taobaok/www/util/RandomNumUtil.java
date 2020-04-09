package xyz.taobaok.www.util;

import java.util.Random;

/**
 * @Author weiranliu
 * @Email liuweiran12138@outlook.com
 * @Date 2020/4/3   3:59 下午
 * @Version 1.0
 */
public class RandomNumUtil {


    //随机数长度自定义
    public static String RandomNum(int length){
        String val = "";
        Random random = new Random();
        for (int i = 0; i < length; i++) {
            val += String.valueOf(random.nextInt(10));
        }
        return val;
    }
}
