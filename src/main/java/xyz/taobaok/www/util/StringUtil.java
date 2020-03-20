package xyz.taobaok.www.util;

//String工具类
public class StringUtil {

    /**
     * 判断字符串是否为空的正则表达式，空白字符对应的unicode编码
     */
    private static final String EMPTY_REGEX = "[\\s\\u00a0\\u2007\\u202f\\u0009-\\u000d\\u001c-\\u001f]+";

    //出去null或者""
    public static String formatNull(String src){
        return (src == null ||"null".equals(src))?"":src;
    }
    /**
     * 验证字符串是否为空
     *
     * @param input
     * @return
     */
    public static boolean isEmpty(String input) {
        return input == null || input.equals("") || input.matches(EMPTY_REGEX);
    }

    public static boolean isNotEmpty(String input){
        return !isEmpty(input);
    }
}
