package xyz.taobaok.www.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import xyz.taobaok.www.bean.BeanController;
import xyz.taobaok.www.bean.UserDataBean;
import xyz.taobaok.www.databaseServer.UserService;
import xyz.taobaok.www.portal.dao.UserMapper;
import xyz.taobaok.www.util.CreateValidateCode;

import javax.imageio.ImageIO;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Map;

/**
 * 实现用户信息的模块controller
 * @Author weiranliu
 * @Email liuweiran12138@outlook.com
 * @Date 2020/4/7   4:47 下午
 * @Version 1.0
 */
@Controller
@RequestMapping(value = "/user")
public class UserController extends BeanController {


    @Autowired
    UserService userService;

    /**
     * 登陆系统，校验是否第一次登陆
     * @param session
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/login",method = RequestMethod.GET)
    public Object login(HttpSession session){
        ModelAndView mode = new ModelAndView();
        try {
            Object user = session.getAttribute("userinfo");
            if (user == null){
                //跳转登陆页面
                mode.setViewName("tologin");
            }else{
                //跳转我的页面
                try {
                    UserDataBean userinfo = (UserDataBean) user;
                } catch (Exception e) {
                    //跳转登陆页面
                    mode.setViewName("tologin");
                }
                mode.setViewName("my");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return mode;
    }


    /**
     * 登陆提交信息校验
     * @param phone
     * @param password
     * @param checkCode
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/logininfo",method = RequestMethod.POST)
    public Object logininfo(String phone,String password,String checkCode,HttpServletRequest request){
        start();
        try {
            //验证码校验
            HttpSession session = request.getSession();
            String code = (String) session.getAttribute("code");
            if (!code.equals(checkCode)){
                success(false);
                message("验证码不正确,请重试或更换验证码");
                data(2);
                return end();
            }
            UserDataBean userinfo = userService.checkUserInfo(phone,password);
            if (userinfo == null){
                success(false);
                message("手机号或密码错误！");
                data(1);
                return end();
            }
            success(true);
            session.setAttribute("userinfo",userinfo);
        } catch (Exception e) {
            success(false);
            message("注册出现异常，请联系管理员");
            data(1);
        }
        return end();
    }
    /**
     * 验证码
     * @param response
     * @param request
     * @throws IOException
     */
    @RequestMapping("/checkCode")
    public void getValidateCode(HttpServletResponse response, HttpServletRequest request) throws IOException {
        //创建输出流
        OutputStream outputStream = response.getOutputStream();
        //获取session
        HttpSession session = request.getSession();
        //获取验证码
        CreateValidateCode createValidateCode = new CreateValidateCode();
        String generateVerifyCode = createValidateCode.getString();
        //将验证码存入session，做登录验证
        session.setAttribute("code", generateVerifyCode);
        //获取验证码图片
        BufferedImage image = createValidateCode.getImage();
        ImageIO.write(image, "png", outputStream);
        //关流
        outputStream.flush();
        outputStream.close();
    }
    /**
     *  跳转注册页面
     * @return
     */
    @RequestMapping(value = "/sign",method = RequestMethod.GET)
    public String sign(){
        return "sign";
    }


    /**
     * 触发注册提交
     * @param email         邮箱地址
     * @param name          姓名
     * @param phone         手机号
     * @param password      密码
     * @param sex           性别
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/subinfo",method = RequestMethod.POST)
    public Object subinfo(HttpServletRequest request,String email,String name,String phone,String password,String sex,String checkCode){
        start();
        try {
            Integer intsex = Integer.valueOf(sex);
            String jsessionid = request.getSession().getId();
            if (jsessionid == null || jsessionid.equals("")){
                success(false);
                message("注册失败，检测到你非法注册");
                data(1);
                return end();
            }
            //校验验证码
            String code = (String) request.getSession().getAttribute("code");
            if (!code.equals(checkCode)){
                success(false);
                message("验证码不正确,请重试或更换验证码");
                data(2);
                return end();
            }
            //查询数据库是否有此账号 ：校验信息 手机号
            int num = userService.queryUserInfo(phone);
            if (num >0){
                success(false);
                message("手机号已被注册");
                data(3);
                return end();
            }
            boolean success = userService.setUserInfo(jsessionid,email,name,phone,password,intsex);
            if (success){
                success(success);
                message("注册成功！正在跳转登陆页面");
            }else{
                success(false);
                message("注册失败，提交信息错误，请联系管理员");
                data(1);
            }
        } catch (NumberFormatException e) {
            success(false);
            message("注册出现异常，请联系管理员");
            data(1);
        }
        return end();
    }
}
