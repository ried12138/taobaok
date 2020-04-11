package xyz.taobaok.www.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import xyz.taobaok.www.bean.BeanController;
import xyz.taobaok.www.bean.UserBehaviorDataBean;
import xyz.taobaok.www.bean.UserDataBean;
import xyz.taobaok.www.databaseServer.UserService;
import xyz.taobaok.www.util.CreateValidateCode;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

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
                    userinfo = userService.selectUserInfo(userinfo.getId());
                    session.setAttribute("userinfo",userinfo);
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
    @RequestMapping(value = "/outuser",method = RequestMethod.GET)
    public String outuser(HttpSession session){
        session.removeAttribute("userinfo");
       return "views/home";
    }
    /**
     * 跳转收藏页面
     * @param session
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/collection",method = RequestMethod.GET)
    public Object collection(HttpSession session){
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
                    //通过userid获取收藏夹的商品id
                    List<UserBehaviorDataBean> list = userService.queryShopId(userinfo.getId());
                    mode.addObject("UserBehaviorDataBean",list);
                } catch (Exception e) {
                    //跳转登陆页面
                    mode.setViewName("tologin");
                }
                mode.setViewName("collection");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return mode;
    }

    /**
     * 删除收藏
     * @param userid        //用户id
     * @param collid        //商品id
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/collectiondel",method = RequestMethod.POST)
    public Object collectiondel(String userid,String collid){
        start();
        try {
            Integer sum = userService.delcollection(userid,collid);
            if (sum == 1){
                success(true);
                message("移除收藏夹");
                data(1);
            }else{
                success(false);
                message("移除失败，请重试");
                data(0);
            }
        } catch (Exception e) {
            success(false);
            message("移除失败，有异常！");
            data(0);
        }
        return end();
    }
    /**
     * 提交收藏信息
     * @param goodsId
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/collection",method = RequestMethod.POST)
    public Object collectionsub(HttpSession session,String goodsId,String title,String pic,String originalPrice,String actualPrice){
        start();
        try {
            Object userinfo = session.getAttribute("userinfo");
            if (userinfo !=null){
                UserDataBean user = (UserDataBean) userinfo;
                //商品是否存在
                Integer num = userService.selectGoodsid(user.getId(),goodsId);
                if (num == 0){
                    //检查收藏夹是否满了
                    Integer nu = userService.selectCollection(user.getId());
                    if (nu >= 100){
                        success(false);
                        message("收藏夹满了，请删除一些再添加吧！");
                        data(0);
                    }else{
                        //添加收藏信息
                        Integer set = userService.instCoolection(user.getId(),goodsId,title,pic,originalPrice,actualPrice);
                        if (set == 1){
                            success(true);
                            data(1);
                            message("收藏成功");
                            userService.updateUserInfoCoolection(user.getId(),nu);
                        }else{
                            success(false);
                            message("收藏失败，请检查网络后重试");
                        }
                    }
                }else{
                    success(false);
                    message("商品已存在收藏夹！");
                    data(1);
                }
            }else{
                success(false);
                message("你还没有登陆，登陆账号后可以添加收藏");
                data(0);
            }
        } catch (Exception e) {
            success(false);
            message("出现异常，请检查网络后重试！");
            data(0);
        }
        return end();
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
            message("登陆出现异常，请联系管理员");
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
