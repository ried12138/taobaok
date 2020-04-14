package xyz.taobaok.www.controller;

import com.alibaba.fastjson.JSON;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import xyz.taobaok.www.bean.BeanController;
import xyz.taobaok.www.bean.UserBehaviorDataBean;
import xyz.taobaok.www.bean.UserDataBean;
import xyz.taobaok.www.bean.signListBean;
import xyz.taobaok.www.databaseServer.UserService;
import xyz.taobaok.www.util.CreateValidateCode;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.*;

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

    /**
     * 退出账号
     * @param session
     * @return
     */
    @RequestMapping(value = "/outuser",method = RequestMethod.GET)
    public String outuser(HttpSession session){
        session.removeAttribute("userinfo");
       return "forward:/index";
    }

    /**
     * 跳转积分系统
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/register",method = RequestMethod.GET)
    public Object register(HttpSession session){
        ModelAndView mode = new ModelAndView();
        Object user = session.getAttribute("userinfo");
        if (user == null){
            //跳转登陆页面
            mode.setViewName("tologin");
        }else{
            mode.setViewName("register/index");
        }
        return mode;
    }

    /**
     * 查询签到信息
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/registerInfo",method = RequestMethod.GET)
    public Object registerInfo(HttpSession session){
        start();
        Object user = session.getAttribute("userinfo");
        if (user == null){
            success(false);
            message("还没有登陆，需要登陆后才可以签到");
        }else{
            UserDataBean userinfo = (UserDataBean) user;
            Calendar cal = Calendar.getInstance();
            //当前几号
            int Day = cal.get(Calendar.DAY_OF_MONTH);
            //签到持续天数
            Integer continueDay = userinfo.getContinueDay();
            //本月第一次签到的日期时间
            String rigninDay = userinfo.getRigninDay();
            String daynum = "";
            if (!rigninDay.equals("")){
                //取日期
                daynum = rigninDay.substring(rigninDay.length() - 2);
                if (continueDay > Day){
                    userinfo.setContinueDay(0);
                }else{
                    if (continueDay !=0){
                        List<signListBean> list = new ArrayList<>();
                        for (int i = 0;i < continueDay;i++){
                            signListBean signList = new signListBean();
                            signList.setSignDay(String.valueOf(Integer.valueOf(daynum)+i));
                            list.add(signList);
                        }
                        data(list);
                        success(true);
                    }else{
                    }
                }
            }else{
                success(false);
            }
            session.setAttribute("userinfo",userinfo);
        }
        return end();
    }

    /**
     * 提交签到信息
     * @param session
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/registersub",method = RequestMethod.GET)
    public Object registersub(HttpSession session){
        start();
        try {
            Object user = session.getAttribute("userinfo");
            if (user == null){
                success(false);
                message("还没有登陆，需要登陆后才可以签到");
            }else{
                UserDataBean userinfo = (UserDataBean) user;
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                //当前日期
                String format = sdf.format(new Date());
                //签到日期
                String rigninTime = userinfo.getRigninTime();
                if (rigninTime == null){
                    //第一次签到，签到时间戳改为今天
                    userinfo.setRigninTime(format);
                    //积分+1
                    userinfo.setScore(userinfo.getScore()+1);
                    //签到持续天数+1
                    userinfo.setContinueDay(userinfo.getContinueDay()+1);
                    //签到累计天数+1
                    userinfo.setRigninCount(userinfo.getRigninCount()+1);
                    //添加本月第一次签到日期（签到连续时常标示)
                    userinfo.setRigninDay(format);
                    //提交签到信息
                    Integer integer = userService.updateUserInfoRegister(userinfo);
                    if (integer >= 1){
                        success(true);
                        data(userinfo);
                        session.setAttribute("userinfo",userinfo);
                    }else{
                        success(false);
                        message("签到失败，请联系管理员");
                    }
                }else if (!rigninTime.equals(format)){
                    //校验是否连续签到
                    String rigninDay = userinfo.getRigninDay();
                    String dayString = rigninDay.substring(rigninDay.length() - 2);
                    //取第一次连续签到的日期 也就是几号
                    Integer daynum = Integer.valueOf(dayString);
                    //持续天数
                    Integer continueDay = userinfo.getContinueDay();
                    //取当前日期是几号
                    String formatstr = format.substring(format.length() - 2);
                    Integer formatnum = Integer.valueOf(formatstr);
                    if (((daynum+continueDay)) == formatnum){
                        //签到持续天数+1
                        userinfo.setContinueDay(userinfo.getContinueDay()+1);
                    }else{
                        //签到持续天数0第一天开始
                        userinfo.setContinueDay(1);
                        //修改本月第一次签到日期（签到连续时常标示)
                        userinfo.setRigninDay(format);
                    }

                    //积分+1
                    userinfo.setScore(userinfo.getScore()+1);
                    //签到累计天数+1
                    userinfo.setRigninCount(userinfo.getRigninCount()+1);
                    //签到时间戳改为今天
                    userinfo.setRigninTime(format);
                    //提交签到信息
                    Integer integer = userService.updateUserInfoRegister(userinfo);
                    if (integer >= 1){
                        session.setAttribute("userinfo",userinfo);
                        success(true);
                        data(userinfo);
                    }else{
                        success(false);
                        message("签到失败，请联系管理员");
                    }
                }else if(rigninTime.equals(format)){
                    success(false);
                    message("你已经签到了，请明天再来吧");
                }
            }
        } catch (Exception e) {
            success(false);
            message("签到出现了异常，请联系管理员");
        }
        return end();
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
    public Object collectiondel(HttpSession session,String userid,String collid){
        start();
        try {
            Integer sum = userService.delcollection(userid,collid);
            if (sum == 1){
                Integer nu = userService.selectCollection(Integer.valueOf(userid));
                userService.updateUserInfoCoolection(Integer.valueOf(userid),nu);
                Object userinfo = session.getAttribute("userinfo");
                UserDataBean user = (UserDataBean) userinfo;
                user.setCollectionNum(nu);
                session.setAttribute("userinfo",user);
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
                            user.setCollectionNum(nu);
                            session.setAttribute("userinfo",user);
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
