package xyz.taobaok.www.databaseServer;

import org.apache.ibatis.annotations.Param;
import xyz.taobaok.www.bean.UserDataBean;

/**
 * @Author weiranliu
 * @Email liuweiran12138@outlook.com
 * @Date 2020/4/9   10:22 上午
 * @Version 1.0
 */
public interface UserService {
    //数据库插入注册信息
    boolean setUserInfo(String jsessionid, String email, String name, String phone, String password, Integer intsex);

    //查询邮箱和手机号是否存在
    int queryUserInfo(String phone);

    //登陆验证
    UserDataBean checkUserInfo(String phone, String password);
}
