package xyz.taobaok.www.util;

import java.awt.*;
import java.awt.image.BufferedImage;
import java.util.Random;

/**
 * 验证码
 * @Author weiranliu
 * @Email liuweiran12138@outlook.com
 * @Date 2020/4/8   5:42 下午
 * @Version 1.0
 */
public class CreateValidateCode {
    private BufferedImage image;// 图像
    private String str;// 验证码
    private static char code[] = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ123456789".toCharArray();

    public static final String SESSION_CODE_NAME = "code";

    public CreateValidateCode() {
        init();// 初始化属性
    }

    /*
     * 取得RandomNumUtil实例
     */
    public static CreateValidateCode Instance() {
        return new CreateValidateCode();
    }

    /*
     * 取得验证码图片
     */
    public BufferedImage getImage() {
        return this.image;
    }

    /*
     * 取得图片的验证码
     */
    public String getString() {
        return str.toLowerCase();
    }

    private void init() {
        // 在内存中创建图象
        int width = 60, height = 20;
        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        // 获取图形上下文
        Graphics g = image.getGraphics();
        // 生成随机类
        Random random = new Random();
        // 设定背景色
        g.setColor(getRandColor(200, 250));
        g.fillRect(0, 0, width, height);
        // 设定字体
        g.setFont(new Font("Times New Roman", Font.PLAIN, 18));
        // 随机产生155条干扰线，使图象中的认证码不易被其它程序探测到
        g.setColor(getRandColor(160, 200));
        for (int i = 0; i < 155; i++) {
            int x = random.nextInt(width);
            int y = random.nextInt(height);
            int xl = random.nextInt(12);
            int yl = random.nextInt(12);
            g.drawLine(x, y, x + xl, y + yl);
        }
        // 取随机产生的认证码(4位数字)
        String sRand = "";
        for (int i = 0; i < 4; i++) {
            String rand = String.valueOf(code[random.nextInt(code.length)]);
            sRand += rand;
            // 将认证码显示到图象中
            g.setColor(new Color(20 + random.nextInt(110), 20 + random.nextInt(110), 20 + random.nextInt(110)));
            // 调用函数出来的颜色相同，可能是因为种子太接近，所以只能直接生成
            g.drawString(rand, 13 * i + 6, 16);
        }
        // 赋值验证码

        this.str = sRand;


        // 图象生效
        g.dispose();

        /* 赋值图像 */
        this.image = image;
    }

    /**
     * @param fc
     * @param bc
     * @return 给定范围获得随机颜色
     */
    private Color getRandColor(int fc, int bc) {
        Random random = new Random();
        if (fc > 255) {
            fc = 255;
        }
        if (bc > 255) {
            bc = 255;
        }
        int r = fc + random.nextInt(bc - fc);
        int g = fc + random.nextInt(bc - fc);
        int b = fc + random.nextInt(bc - fc);
        return new Color(r, g, b);
    }

}