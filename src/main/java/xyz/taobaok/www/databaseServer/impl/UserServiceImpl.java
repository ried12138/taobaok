package xyz.taobaok.www.databaseServer.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xyz.taobaok.www.bean.UserDataBean;
import xyz.taobaok.www.databaseServer.UserService;
import xyz.taobaok.www.portal.dao.UserMapper;
import xyz.taobaok.www.util.dataoke.SignMD5Util;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 实现用户数据库操作服务
 * @Author weiranliu
 * @Email liuweiran12138@outlook.com
 * @Date 2020/4/9   10:23 上午
 * @Version 1.0
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserMapper userMapper;
    /**
     * 插入数据库用户信息，注册
     *
     * @param jsessionid
     * @param email             邮箱地址
     * @param name              姓名
     * @param phone             手机号
     * @param password          密码
     * @param intsex            性别
     * @return
     */
    @Override
    public boolean setUserInfo(String jsessionid, String email, String name, String phone, String password, Integer intsex) {
        //加密密码
        String md5pwd = SignMD5Util.MD5(password);
        //设置日期格式
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String creatData = df.format(new Date());
        UserDataBean userDataBean = new UserDataBean(intsex,name,md5pwd,jsessionid,phone,email,creatData);
        int i = userMapper.instUserInfo(userDataBean);
        if (i >= 1 ){
            return true;
        }
        return false;
    }


    @Override
    public int queryUserInfo(String phone) {
        int num = userMapper.queryUserInfo(phone);
        return num;
    }

    /**
     *  登陆信息验证
     * @param phone
     * @param password
     * @return
     */
    @Override
    public UserDataBean checkUserInfo(String phone, String password) {
        String md5pwd = SignMD5Util.MD5(password);
        UserDataBean userDataBean = userMapper.checkUserInfo(phone,md5pwd);
        return userDataBean;
    }
}
